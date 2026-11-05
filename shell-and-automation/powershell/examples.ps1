# Windows PowerShell 5.1 or PowerShell 7; only in-memory objects change.
Set-StrictMode -Version Latest

function Format-Task {
    param(
        [Parameter(Mandatory = $true)]
        [psobject]$Task
    )
    # Functions emit objects to the pipeline; avoid incidental output.
    $marker = if ($Task.Done) { 'x' } else { ' ' }
    '[{0}] {1}' -f $marker, $Task.Name
}

[string]$title = 'Launch checklist'
$tasks = @(
    [pscustomobject]@{ Name = 'Read the guide'; Done = $true }
    [pscustomobject]@{ Name = 'Build a sample'; Done = $false }
    [pscustomobject]@{ Name = 'Share notes'; Done = $false }
)

# Where-Object filters objects rather than parsing display text.
$next = $tasks | Where-Object { -not $_.Done } | Select-Object -First 1
if ($null -ne $next) {
    $next.Done = $true
}

Write-Output $title
foreach ($task in $tasks) {
    Format-Task -Task $task
}

# @() keeps a stable array shape even for zero or one result.
$completed = @($tasks | Where-Object { $_.Done })
$pending = @($tasks | Where-Object { -not $_.Done })
'Completed: {0}/{1}' -f $completed.Count, $tasks.Count
'Pending: {0}' -f ($pending.Name -join ', ')

# A hashtable maps keys to values; ordered preserves insertion order.
$counts = [ordered]@{
    Done = $completed.Count
    Pending = $pending.Count
}
foreach ($entry in $counts.GetEnumerator()) {
    '{0}: {1}' -f $entry.Key, $entry.Value
}

<# Arrays contain references to these objects.
   Construct fresh objects when an independent editable copy is needed. #>
$draft = @($tasks | ForEach-Object {
    [pscustomobject]@{ Name = $_.Name; Done = $_.Done }
})
$draft[0].Name = 'Read the revised guide'
'Original: {0}' -f $tasks[0].Name
'Draft: {0}' -f $draft[0].Name
