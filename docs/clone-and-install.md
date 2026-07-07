# Clone and Install

Use this starter pack when starting or improving a web project with Codex.

## Clone

```powershell
git clone https://github.com/akhelasi/codex-starter-pack.git
```

## Install Into A Project

From the cloned starter pack folder:

```powershell
.\scripts\install-starter-pack.ps1 -TargetPath "D:\path\to\your-project"
```

If Windows blocks `.ps1` scripts with an execution policy error, use:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-starter-pack.ps1 -TargetPath "D:\path\to\your-project"
```

This copies:

- `AGENTS.md`
- `.agents`
- `.codex`
- `docs`
- `templates`

It does not copy focused packs or generated experiments from `outputs` by default.

To copy focused packs such as `packs/binance-trading/`, run:

```powershell
.\scripts\install-starter-pack.ps1 -TargetPath "D:\path\to\your-project" -IncludePacks
```

Execution-policy-safe version:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-starter-pack.ps1 -TargetPath "D:\path\to\your-project" -IncludePacks
```

The installer is safe to run again. It copies files to their exact target paths and merges starter-pack folders without creating nested folders such as `.agents\.agents`.

## Optional Memory Tools

The starter pack includes an optional installer wrapper for Obsidian and Codebase Memory MCP. These tools are not installed by the normal project installer.

Install Obsidian when you want a local UI for Markdown notes:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-optional-memory-tools.ps1 -InstallObsidian
```

Install Codebase Memory MCP binary-only when a large codebase needs graph search or impact analysis:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-optional-memory-tools.ps1 -InstallCodebaseMemory
```

Configure Codebase Memory MCP with Codex only after reviewing `docs/codebase-memory-mcp-research.md` and approving the config change.

## Prompt For Codex

After installing into a project, tell Codex:

```text
Work in this project using AGENTS.md. Review .agents/skills and use only the skill, MCP server, or tool needed for the current task. Ask before GitHub write actions, deploys, database changes, or destructive operations.
```

## Work Computer Setup Prompt

On a work computer, tell Codex:

```text
I want you to install my Codex starter pack from this GitHub repo:
https://github.com/akhelasi/codex-starter-pack

First check whether Git, Node.js, npm/npx, GitHub CLI, and Codex CLI are available. If something is missing, explain it or install it safely.

Then clone the starter pack and install it into the project I am working on.

Use AGENTS.md and .agents/skills. Use only the skill, MCP server, or tool needed for the current task. Do not install or enable sensitive MCP servers such as production database, broad filesystem, Figma, Sentry, Slack, Drive, or Notion without my approval.
```

If the project folder already exists, say:

```text
The project folder is:
D:\path\to\my-project

Clone:
https://github.com/akhelasi/codex-starter-pack

Then run:
.\scripts\install-starter-pack.ps1 -TargetPath "D:\path\to\my-project"

If Windows blocks the script, run:
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-starter-pack.ps1 -TargetPath "D:\path\to\my-project"
```

For GitHub access on the work computer, tell Codex:

```text
Install GitHub CLI if needed and guide me through `gh auth login`. Do not ask me to paste a token into chat. I will log in through the browser.
```

After installation, tell Codex inside the project:

```text
Work in this project using AGENTS.md. Review .agents/skills and use only the skill, MCP server, or tool needed for the current task. Ask before GitHub write actions, deploys, database changes, or destructive operations.
```
