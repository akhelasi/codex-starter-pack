param(
  [Parameter(Mandatory = $true)]
  [string]$TargetPath,

  [switch]$IncludePacks
)

$sourceRoot = Split-Path -Parent $PSScriptRoot
$targetRoot = (Resolve-Path -LiteralPath $TargetPath -ErrorAction SilentlyContinue).Path

if (-not $targetRoot) {
  New-Item -ItemType Directory -Force -Path $TargetPath | Out-Null
  $targetRoot = (Resolve-Path -LiteralPath $TargetPath).Path
}

function Copy-StarterPackItem {
  param(
    [Parameter(Mandatory = $true)]
    [string]$Source,

    [Parameter(Mandatory = $true)]
    [string]$Destination
  )

  if (-not (Test-Path -LiteralPath $Source)) {
    return
  }

  $sourceItem = Get-Item -LiteralPath $Source -Force

  if ($sourceItem.PSIsContainer) {
    if (-not (Test-Path -LiteralPath $Destination)) {
      New-Item -ItemType Directory -Force -Path $Destination | Out-Null
    }

    foreach ($child in Get-ChildItem -LiteralPath $Source -Force) {
      Copy-StarterPackItem -Source $child.FullName -Destination (Join-Path $Destination $child.Name)
    }

    return
  }

  $destinationParent = Split-Path -Parent $Destination
  if ($destinationParent -and -not (Test-Path -LiteralPath $destinationParent)) {
    New-Item -ItemType Directory -Force -Path $destinationParent | Out-Null
  }

  Copy-Item -LiteralPath $Source -Destination $Destination -Force
}

$items = @(
  "AGENTS.md",
  ".agents",
  ".codex",
  "docs",
  "templates"
)

if ($IncludePacks) {
  $items += "packs"
}

foreach ($item in $items) {
  $src = Join-Path $sourceRoot $item
  $dst = Join-Path $targetRoot $item
  Copy-StarterPackItem -Source $src -Destination $dst
}

Write-Host "Codex starter pack installed to $targetRoot"
