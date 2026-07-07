param(
    [switch]$InstallObsidian,
    [switch]$InstallCodebaseMemory,
    [switch]$ConfigureCodebaseMemory,
    [switch]$CodebaseMemoryUi,
    [string]$CodebaseMemoryInstallDir = "",
    [string]$CodebaseMemoryInstallerUrl = "https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.ps1",
    [switch]$WhatIfOnly
)

$ErrorActionPreference = "Stop"

function Test-CommandExists {
    param([string]$Name)
    return [bool](Get-Command $Name -ErrorAction SilentlyContinue)
}

function Write-Section {
    param([string]$Title)
    Write-Host ""
    Write-Host "== $Title =="
}

if (-not $InstallObsidian -and -not $InstallCodebaseMemory) {
    Write-Host "Optional memory tooling installer"
    Write-Host ""
    Write-Host "Usage examples:"
    Write-Host "  powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-optional-memory-tools.ps1 -InstallObsidian"
    Write-Host "  powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-optional-memory-tools.ps1 -InstallCodebaseMemory"
    Write-Host "  powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-optional-memory-tools.ps1 -InstallCodebaseMemory -ConfigureCodebaseMemory"
    Write-Host ""
    Write-Host "Notes:"
    Write-Host "  - Obsidian is optional; Codex can use plain Markdown notes without the app."
    Write-Host "  - Codebase Memory MCP is installed binary-only by default using --skip-config."
    Write-Host "  - Add -ConfigureCodebaseMemory only after reviewing docs/codebase-memory-mcp-research.md."
    exit 0
}

if ($InstallObsidian) {
    Write-Section "Obsidian"

    if (-not (Test-CommandExists "winget.exe")) {
        Write-Warning "winget.exe was not found. Install Obsidian manually from https://obsidian.md/download"
    } elseif ($WhatIfOnly) {
        Write-Host "Would run: winget install --id Obsidian.Obsidian --exact --source winget"
    } else {
        winget install --id Obsidian.Obsidian --exact --source winget --accept-package-agreements --accept-source-agreements
    }
}

if ($InstallCodebaseMemory) {
    Write-Section "Codebase Memory MCP"
    Write-Host "Installer URL: $CodebaseMemoryInstallerUrl"
    Write-Host "Review guide: docs/codebase-memory-mcp-research.md"

    if ($CodebaseMemoryInstallerUrl -notlike "https://*" -and
        $CodebaseMemoryInstallerUrl -notlike "http://localhost*" -and
        $CodebaseMemoryInstallerUrl -notlike "http://127.0.0.1*") {
        throw "Refusing non-HTTPS installer URL: $CodebaseMemoryInstallerUrl"
    }

    $installerPath = Join-Path $env:TEMP "install-codebase-memory-mcp.ps1"

    if ($WhatIfOnly) {
        Write-Host "Would download: $CodebaseMemoryInstallerUrl"
    } else {
        Invoke-WebRequest -Uri $CodebaseMemoryInstallerUrl -OutFile $installerPath -UseBasicParsing
        $hash = Get-FileHash -Path $installerPath -Algorithm SHA256
        Write-Host "Downloaded installer: $installerPath"
        Write-Host "SHA256: $($hash.Hash)"
    }

    $installerArgs = @()
    if ($CodebaseMemoryUi) {
        $installerArgs += "--ui"
    }
    if (-not $ConfigureCodebaseMemory) {
        $installerArgs += "--skip-config"
    }
    if ($CodebaseMemoryInstallDir.Trim().Length -gt 0) {
        $installerArgs += "--dir=$CodebaseMemoryInstallDir"
    }

    if ($WhatIfOnly) {
        Write-Host "Would run installer args: $($installerArgs -join ' ')"
    } else {
        powershell.exe -NoProfile -ExecutionPolicy Bypass -File $installerPath @installerArgs
    }

    if (-not $ConfigureCodebaseMemory) {
        Write-Host ""
        Write-Host "Codebase Memory MCP was requested in binary-only mode."
        Write-Host "Configure Codex MCP manually later, or re-run with -ConfigureCodebaseMemory after approval."
    }
}
