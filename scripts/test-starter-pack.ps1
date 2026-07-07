param(
    [switch]$SkipInstallSmoke
)

$ErrorActionPreference = "Stop"

$starterRoot = Split-Path -Parent $PSScriptRoot
$failures = New-Object System.Collections.Generic.List[string]

function Add-Failure {
    param([string]$Message)
    $script:failures.Add($Message)
    Write-Host "FAIL: $Message" -ForegroundColor Red
}

function Add-Ok {
    param([string]$Message)
    Write-Host "OK: $Message" -ForegroundColor Green
}

function Test-RequiredPath {
    param([string]$RelativePath)
    $path = Join-Path $starterRoot $RelativePath
    if (Test-Path -LiteralPath $path) {
        Add-Ok $RelativePath
    } else {
        Add-Failure "Missing required path: $RelativePath"
    }
}

function Test-NoSensitivePatterns {
    $patterns = @("gho_", "github_pat_", "BEGIN PRIVATE KEY", "password=", "token=", "secret=")
    $files = Get-ChildItem -LiteralPath $starterRoot -Recurse -Force -File |
        Where-Object {
            $_.FullName -notmatch "\\.git\\" -and
            $_.FullName -notmatch "\\outputs\\" -and
            $_.Extension -in @(".md", ".toml", ".ps1", ".json", ".txt", ".gitignore")
        }

    foreach ($file in $files) {
        $content = Get-Content -LiteralPath $file.FullName -Raw -ErrorAction SilentlyContinue
        foreach ($pattern in $patterns) {
            if ($content -like "*$pattern*") {
                $relative = Resolve-Path -LiteralPath $file.FullName -Relative
                if ($relative -like "*recursive-starter-pack-improvement*" -or
                    $relative -like "*test-starter-pack.ps1") {
                    continue
                }
                Add-Failure "Sensitive-looking pattern '$pattern' in $relative"
            }
        }
    }
}

Write-Host "Starter pack doctor"
Write-Host "Root: $starterRoot"
Write-Host ""

$required = @(
    "AGENTS.md",
    "README.md",
    ".agents/skills/web-project-workflow/SKILL.md",
    ".agents/skills/php-sql-safety-review/SKILL.md",
    ".agents/skills/frontend-browser-qa/SKILL.md",
    ".codex/config.example.toml",
    "docs/setup-checklist.md",
    "docs/skills-mcp-security-review.md",
    "docs/codebase-memory-mcp-research.md",
    "templates/task-brief.md",
    "scripts/install-starter-pack.ps1",
    "scripts/install-optional-memory-tools.ps1",
    "scripts/new-project-bootstrap.ps1"
)

foreach ($item in $required) {
    Test-RequiredPath $item
}

Test-NoSensitivePatterns

if (-not $SkipInstallSmoke) {
    $testRoot = Join-Path ([System.IO.Path]::GetTempPath()) "codex-starter-pack-doctor-$([guid]::NewGuid().ToString('N'))"
    New-Item -ItemType Directory -Force -Path $testRoot | Out-Null

    try {
        & (Join-Path $starterRoot "scripts/install-starter-pack.ps1") -TargetPath $testRoot -Profile WebFull
        $copiedScript = Join-Path $testRoot "scripts/install-optional-memory-tools.ps1"
        if (Test-Path -LiteralPath $copiedScript) {
            Add-Ok "install smoke copied scripts/"
        } else {
            Add-Failure "install smoke did not copy scripts/"
        }

        & (Join-Path $testRoot "scripts/new-project-bootstrap.ps1") -TargetPath $testRoot -ProjectType PhpSql -IncludeBrowserQa

        foreach ($expected in @(
            "docs/project-checklist.md",
            "docs/project-worklog.md",
            "docs/codex-continuation-prompt.md",
            "docs/browser-qa-report.md",
            "docs/php-sql-migration-plan.md"
        )) {
            if (Test-Path -LiteralPath (Join-Path $testRoot $expected)) {
                Add-Ok "bootstrap created $expected"
            } else {
                Add-Failure "bootstrap missed $expected"
            }
        }

        & (Join-Path $testRoot "scripts/install-optional-memory-tools.ps1") -InstallCodebaseMemory -WhatIfOnly
    } finally {
        $resolvedTestRoot = (Resolve-Path -LiteralPath $testRoot -ErrorAction SilentlyContinue).Path
        $tempRoot = [System.IO.Path]::GetTempPath()
        if ($resolvedTestRoot -and $resolvedTestRoot.StartsWith($tempRoot, [System.StringComparison]::OrdinalIgnoreCase)) {
            Remove-Item -LiteralPath $resolvedTestRoot -Recurse -Force -ErrorAction SilentlyContinue
        }
    }
}

if ($failures.Count -gt 0) {
    Write-Host ""
    Write-Host "Starter pack doctor found $($failures.Count) problem(s)." -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "Starter pack doctor passed." -ForegroundColor Green
