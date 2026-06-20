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

This copies:

- `AGENTS.md`
- `.agents`
- `.codex`
- `docs`
- `templates`

It does not copy generated experiments from `outputs`.

## Prompt For Codex

After installing into a project, tell Codex:

```text
Work in this project using AGENTS.md. Review .agents/skills and use only the skill, MCP server, or tool needed for the current task. Ask before GitHub write actions, deploys, database changes, or destructive operations.
```
