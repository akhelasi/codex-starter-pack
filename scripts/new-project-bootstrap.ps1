param(
    [string]$TargetPath = ".",
    [ValidateSet("Web", "PhpSql", "Trading", "Game", "Generic")]
    [string]$ProjectType = "Web",
    [switch]$CreateNotes,
    [switch]$IncludeBrowserQa,
    [switch]$Force
)

$ErrorActionPreference = "Stop"

$starterRoot = Split-Path -Parent $PSScriptRoot
$targetRoot = (Resolve-Path -LiteralPath $TargetPath -ErrorAction SilentlyContinue).Path

if (-not $targetRoot) {
    New-Item -ItemType Directory -Force -Path $TargetPath | Out-Null
    $targetRoot = (Resolve-Path -LiteralPath $TargetPath).Path
}

function Copy-Template {
    param(
        [Parameter(Mandatory = $true)]
        [string]$TemplatePath,
        [Parameter(Mandatory = $true)]
        [string]$OutputPath
    )

    if (-not (Test-Path -LiteralPath $TemplatePath)) {
        Write-Warning "Template not found: $TemplatePath"
        return
    }

    $outputParent = Split-Path -Parent $OutputPath
    if ($outputParent -and -not (Test-Path -LiteralPath $outputParent)) {
        New-Item -ItemType Directory -Force -Path $outputParent | Out-Null
    }

    if ((Test-Path -LiteralPath $OutputPath) -and -not $Force) {
        Write-Host "Keeping existing file: $OutputPath"
        return
    }

    Copy-Item -LiteralPath $TemplatePath -Destination $OutputPath -Force
    Write-Host "Created: $OutputPath"
}

function Ensure-GitIgnoreLine {
    param([string]$Line)

    $gitIgnorePath = Join-Path $targetRoot ".gitignore"
    if (-not (Test-Path -LiteralPath $gitIgnorePath)) {
        New-Item -ItemType File -Path $gitIgnorePath -Force | Out-Null
    }

    $existing = Get-Content -LiteralPath $gitIgnorePath -ErrorAction SilentlyContinue
    if ($existing -notcontains $Line) {
        Add-Content -LiteralPath $gitIgnorePath -Value $Line
        Write-Host "Added .gitignore entry: $Line"
    }
}

$docsDir = Join-Path $targetRoot "docs"
New-Item -ItemType Directory -Force -Path $docsDir | Out-Null

$templatePairs = @(
    @{ Template = "templates/project-checklist.md"; Output = "docs/project-checklist.md" },
    @{ Template = "templates/project-worklog.md"; Output = "docs/project-worklog.md" },
    @{ Template = "templates/completion-evidence-matrix.md"; Output = "docs/completion-evidence-matrix.md" },
    @{ Template = "templates/codex-continuation-prompt.md"; Output = "docs/codex-continuation-prompt.md" },
    @{ Template = "templates/task-brief.md"; Output = "docs/task-brief.md" }
)

if ($IncludeBrowserQa) {
    $templatePairs += @{ Template = "templates/browser-qa-report.md"; Output = "docs/browser-qa-report.md" }
}

if ($ProjectType -eq "PhpSql") {
    $templatePairs += @{ Template = "templates/php-sql/env-example.md"; Output = "docs/php-sql-env-example.md" }
    $templatePairs += @{ Template = "templates/php-sql/migration-plan.md"; Output = "docs/php-sql-migration-plan.md" }
    $templatePairs += @{ Template = "templates/php-sql/backup-restore-checklist.md"; Output = "docs/php-sql-backup-restore-checklist.md" }
}

foreach ($pair in $templatePairs) {
    Copy-Template `
        -TemplatePath (Join-Path $starterRoot $pair.Template) `
        -OutputPath (Join-Path $targetRoot $pair.Output)
}

if ($CreateNotes) {
    $notePairs = @(
        @{ Template = "templates/obsidian/project-index.md"; Output = "notes/00-index/Project Index.md" },
        @{ Template = "templates/obsidian/daily-note.md"; Output = "notes/10-daily/Today.md" },
        @{ Template = "templates/obsidian/decision-note.md"; Output = "notes/20-decisions/Decision - Starter.md" },
        @{ Template = "templates/obsidian/research-note.md"; Output = "notes/30-research/Research - Starter.md" },
        @{ Template = "templates/obsidian/handoff-note.md"; Output = "notes/40-handoff/Continuation Prompt.md" }
    )

    foreach ($pair in $notePairs) {
        Copy-Template `
            -TemplatePath (Join-Path $starterRoot $pair.Template) `
            -OutputPath (Join-Path $targetRoot $pair.Output)
    }
}

Ensure-GitIgnoreLine ".env"
Ensure-GitIgnoreLine "*.log"
Ensure-GitIgnoreLine "node_modules/"

if ($ProjectType -eq "PhpSql") {
    Ensure-GitIgnoreLine "vendor/"
    Ensure-GitIgnoreLine "database-dumps/"
    Ensure-GitIgnoreLine "backups/"
    Ensure-GitIgnoreLine "*.dump.sql"
    Ensure-GitIgnoreLine "*_dump.sql"
    Ensure-GitIgnoreLine "*.sqlite"
    Ensure-GitIgnoreLine "*.db"
}

Write-Host ""
Write-Host "Project bootstrap complete."
Write-Host "Target: $targetRoot"
Write-Host "ProjectType: $ProjectType"
