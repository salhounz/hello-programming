Set-StrictMode -Version Latest

<#
    Type Systems & Variables
#>
# Variables use $; type constraints and constants are available when useful.
[int]$score = 10
$score += 5
Set-Variable -Name ExampleLanguage -Value "PowerShell" -Option Constant

<#
    Control Flow Operations
#>
# if, foreach, and Where-Object express decisions and selection.
if ($score -ge 10) { $result = "pass" } else { $result = "retry" }
foreach ($value in 1, 2, 3) { $score += $value }

<#
    Execution Blocks
#>
# Functions and parameter blocks define named operations with typed inputs.
function Add-ExampleNumber {
    param([int]$Left, [int]$Right)
    $Left + $Right
}
$sum = Add-ExampleNumber -Left 2 -Right 3

<#
    Code Health & Documentation
#>
# Use # comments, <# #> block comments, and comment-based help.
# A single-line comment.
<#
A multi-line comment.
Comment-based help can use .SYNOPSIS and .PARAMETER sections.
#>

<#
    Built-In Collections
#>
# Arrays hold ordered objects; hashtables and generic collections support keyed and typed data.
$values = @(1, 2, 3)
$inventory = @{ apples = 3 }
$unique = [System.Collections.Generic.HashSet[int]]::new()
[void]$unique.Add(1)

<#
    Data Mutability
#>
# Arrays and hashtables are reference objects; Clone makes a shallow hashtable copy.
$settings = @{ theme = "light" }
$copied = $settings.Clone()
$copied.theme = "dark"

<#
    Access & Encapsulation
#>
# Scope and functions organize state; hidden class members are not a security boundary.
class ExampleCounter {
    hidden [int]$count = 0
    [void] Increment() { $this.count++ }
    [int] Value() { return $this.count }
}
$counter = [ExampleCounter]::new()
$counter.Increment()

<#
    Design Paradigms & Patterns
#>
# Pipelines compose object transformations rather than only text streams.
$doubled = @($values | ForEach-Object { $_ * 2 })
$selected = @($values | Where-Object { $_ -gt 1 })

<#
    Memory Management
#>
# Managed objects use .NET garbage collection; dispose external resources in finally.
$reader = [System.IO.StringReader]::new("sample")
try { $firstCharacter = $reader.Read() }
finally { $reader.Dispose() }

<#
    Concurrency & Parallelism
#>
# Start-Job runs a background process job; wait, receive, and remove its bookkeeping.
$job = Start-Job -ScriptBlock { 42 }
try {
    $answer = $job | Wait-Job | Receive-Job
} finally {
    Remove-Job -Job $job
}

<#
    Performance Optimization
#>
# Use a generic list for repeated appends rather than repeatedly copying an array with +=.
$batch = [System.Collections.Generic.List[int]]::new()
foreach ($value in 1..10) { $batch.Add($value) }

Write-Output 'Hello, World!'
