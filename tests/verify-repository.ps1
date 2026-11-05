param(
    [ValidateSet(
        'web', 'systems', 'general-applications', 'mobile-and-apple',
        'web-ecosystem', 'infrastructure-and-configuration',
        'shell-and-automation', 'data-and-science', 'database-and-query',
        'functional-and-concurrent', 'enterprise-and-legacy', 'logic',
        'game-development', 'smart-contracts', 'hardware-description'
    )]
    [string] $Group
)

$manifest = [ordered]@{
    'web' = [ordered]@{ 'css' = 'style.css'; 'html' = 'index.html'; 'javascript' = 'hello.js'; 'php' = 'hello.php'; 'typescript' = 'hello.ts' }
    'web-ecosystem' = [ordered]@{ 'angular' = 'hello.ts'; 'astro' = 'src/pages/index.astro'; 'bun' = 'hello.ts'; 'deno' = 'hello.ts'; 'express' = 'hello.js'; 'htmx' = 'hello.html'; 'nextjs' = 'hello.tsx'; 'nodejs' = 'hello.js'; 'react' = 'hello.jsx'; 'solidjs' = 'hello.tsx'; 'svelte' = 'Hello.svelte'; 'vue' = 'Hello.vue' }
    'infrastructure-and-configuration' = [ordered]@{ 'hcl' = 'hello.tf' }
    'systems' = [ordered]@{ 'assembly' = 'hello.asm'; 'c' = 'hello.c'; 'cpp' = 'hello.cpp'; 'd' = 'hello.d'; 'nim' = 'hello.nim'; 'rust' = 'hello.rs'; 'zig' = 'hello.zig' }
    'general-applications' = [ordered]@{ 'csharp' = 'Hello.cs'; 'dart' = 'hello.dart'; 'go' = 'hello.go'; 'groovy' = 'hello.groovy'; 'java' = 'Hello.java'; 'lua' = 'hello.lua'; 'perl' = 'hello.pl'; 'python' = 'hello.py'; 'ruby' = 'hello.rb'; 'tcl' = 'hello.tcl' }
    'mobile-and-apple' = [ordered]@{ 'kotlin' = 'Hello.kt'; 'objective-c' = 'hello.m'; 'swift' = 'hello.swift' }
    'shell-and-automation' = [ordered]@{ 'bash' = 'hello.sh'; 'batch' = 'hello.bat'; 'fish' = 'hello.fish'; 'powershell' = 'hello.ps1'; 'zsh' = 'hello.zsh' }
    'data-and-science' = [ordered]@{ 'julia' = 'hello.jl'; 'matlab' = 'hello.m'; 'r' = 'hello.r'; 'sas' = 'hello.sas'; 'wolfram' = 'hello.wls' }
    'database-and-query' = [ordered]@{ 'graphql' = 'hello.graphql'; 'plsql' = 'hello.sql'; 'sparql' = 'hello.rq'; 'sql' = 'hello.sql'; 'tsql' = 'hello.sql' }
    'functional-and-concurrent' = [ordered]@{ 'clojure' = 'hello.clj'; 'common-lisp' = 'hello.lisp'; 'elixir' = 'hello.exs'; 'elm' = 'Hello.elm'; 'erlang' = 'hello.erl'; 'fsharp' = 'hello.fsx'; 'haskell' = 'hello.hs'; 'ocaml' = 'hello.ml'; 'racket' = 'hello.rkt'; 'scheme' = 'hello.scm' }
    'enterprise-and-legacy' = [ordered]@{ 'abap' = 'hello.abap'; 'ada' = 'hello.adb'; 'cobol' = 'hello.cob'; 'fortran' = 'hello.f90'; 'pascal' = 'hello.pas'; 'visual-basic' = 'Hello.vb' }
    'logic' = [ordered]@{ 'prolog' = 'hello.pl' }
    'game-development' = [ordered]@{ 'gdscript' = 'hello.gd' }
    'smart-contracts' = [ordered]@{ 'move' = 'hello.move'; 'solidity' = 'Hello.sol'; 'vyper' = 'hello.vy' }
    'hardware-description' = [ordered]@{ 'systemverilog' = 'hello.sv'; 'verilog' = 'hello.v'; 'vhdl' = 'hello.vhd' }
}

$repositoryRoot = Split-Path -Parent $PSScriptRoot
$selectedGroups = if ($Group) { @($Group) } else { @($manifest.Keys) }
$failures = [System.Collections.Generic.List[string]]::new()
$exampleCount = 0

foreach ($groupName in $selectedGroups) {
    $groupPath = Join-Path $repositoryRoot $groupName
    if (-not (Test-Path -LiteralPath $groupPath -PathType Container)) {
        $failures.Add("Missing group directory: $groupName")
        continue
    }

    foreach ($language in $manifest[$groupName].GetEnumerator()) {
        $languagePath = Join-Path $groupPath $language.Key
        $readmePath = Join-Path $languagePath 'README.md'
        $sourcePath = Join-Path $languagePath $language.Value
        $introFiles = @(Get-ChildItem -LiteralPath $languagePath -File -Filter 'examples.*' -ErrorAction SilentlyContinue)

        if (-not (Test-Path -LiteralPath $languagePath -PathType Container)) {
            $failures.Add("Missing language directory: $groupName/$($language.Key)")
            continue
        }
        if (-not (Test-Path -LiteralPath $readmePath -PathType Leaf)) {
            $failures.Add("Missing README: $groupName/$($language.Key)/README.md")
        } else {
            $readme = Get-Content -Raw -LiteralPath $readmePath
            if ($readme -notmatch 'https://') { $failures.Add("Missing HTTPS documentation link: $groupName/$($language.Key)") }
            if ($readme -notmatch '(?m)^(Run|Use):') { $failures.Add("Missing Run or Use instruction: $groupName/$($language.Key)") }
        }
        if (-not (Test-Path -LiteralPath $sourcePath -PathType Leaf)) {
            $failures.Add("Missing source: $groupName/$($language.Key)/$($language.Value)")
        } else {
            $source = Get-Content -Raw -LiteralPath $sourcePath
            if ($source -notmatch [regex]::Escape('Hello, World!')) { $failures.Add("Missing Hello, World! text: $groupName/$($language.Key)") }
        }
        if ($introFiles.Count -ne 1) {
            $failures.Add("Expected one introductory examples file: $groupName/$($language.Key)")
        } else {
            $introFile = $introFiles[0]
            $introLines = @(Get-Content -Encoding UTF8 -LiteralPath $introFile.FullName)
            if ($introLines.Count -ge 100) {
                $failures.Add("Introductory file must be under 100 lines: $groupName/$($language.Key)/$($introFile.Name)")
            }
            if ($introLines.Count -eq 0) {
                $failures.Add("Empty introductory file: $groupName/$($language.Key)/$($introFile.Name)")
            }
            if ((Test-Path -LiteralPath $readmePath) -and -not $readme.Contains("(./$($introFile.Name))")) {
                $failures.Add("README must link introductory file: $groupName/$($language.Key)/$($introFile.Name)")
            }
        }
        $exampleCount++
    }
}

if (-not $Group) {
    $rootReadmePath = Join-Path $repositoryRoot 'README.md'
    if (-not (Test-Path -LiteralPath $rootReadmePath -PathType Leaf)) {
        $failures.Add('Missing root README.md')
    } else {
        $rootReadme = Get-Content -Raw -LiteralPath $rootReadmePath
        foreach ($requiredText in @('# Hello Programming', 'Hello, World!', 'Cody Sullins', 'OpenAI Codex')) {
            if (-not $rootReadme.Contains($requiredText)) { $failures.Add("Root README is missing: $requiredText") }
        }
        foreach ($groupName in $manifest.Keys) {
            if (-not $rootReadme.Contains("href=`"$groupName/`"")) { $failures.Add("Root README tree is missing group link: $groupName") }
        }
        $treeCount = [regex]::Matches($rootReadme, '<pre>').Count
        if ($treeCount -ne 1) { $failures.Add('Root README must contain one connected collection tree') }
        foreach ($groupName in $manifest.Keys) {
            foreach ($languageName in $manifest[$groupName].Keys) {
                if (-not $rootReadme.Contains("href=`"$groupName/$languageName/`"")) {
                    $failures.Add("Root README tree is missing language link: $groupName/$languageName")
                }
            }
        }
    }
}

if ($failures.Count -gt 0) {
    $failures | ForEach-Object { Write-Error $_ }
    exit 1
}

$groupWord = if ($selectedGroups.Count -eq 1) { 'group' } else { 'groups' }
Write-Output "Verified $exampleCount entries with greeting and introductory examples across $($selectedGroups.Count) $groupWord."
