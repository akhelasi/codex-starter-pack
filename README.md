# Codex Starter Pack for Web Development

This repository is a portable Codex starter-pack workspace. The root pack focuses on web projects using HTML, CSS, JavaScript, PHP, SQL, GitHub Pages, XAMPP, and PHP hosting. It also contains focused packs under `packs/`, including an initial Binance/crypto trading pack.

These files are not product code. They are working instructions, reusable skills, checklists, templates, MCP examples, and maintenance notes that help Codex work more like a senior web engineer.

## Contents

- `AGENTS.md` - primary Codex instructions to copy into project roots.
- `.agents/skills/` - reusable Codex skills for web development workflows.
- `.codex/config.example.toml` - MCP configuration examples; not active until copied into real Codex config.
- `docs/clone-and-install.md` - how to clone and install this pack into another project.
- `docs/setup-checklist.md` - setup checklist for new projects.
- `docs/github-management.md` - GitHub, GitHub Pages, XAMPP, and deployment guidance.
- `docs/senior-codex-engineering-playbook.md` - senior workflow adapted from Codex and Claude Code/Karpathy-style agentic coding practices.
- `docs/skills-mcp-security-review.md` - security review of recommended skills and MCP servers.
- `docs/mcp-and-skills-research.md` - research notes and source links for MCP/skill choices.
- `docs/file-maintenance-guide.md` - what to update in which file and when.
- `docs/tooling-stability.md` - notes about patch/write stability issues and mitigation.
- `docs/obsidian-codex-workflow.md` - Obsidian-compatible linked-notes workflow for Codex projects.
- `docs/codebase-memory-mcp-research.md` - optional Codebase Memory MCP research and install-safety policy for large codebases.
- `docs/recursive-starter-pack-improvement.md` - process for promoting verified project lessons back into the starter pack.
- `docs/multi-starter-pack-hub.md` - router plan for web, Binance/trading, Unity/game and future starter packs.
- `docs/plugin-integration-playbook.md` - plugin/connectors use cases, safety tiers, and multi-agent board patterns.
- `docs/starter-pack-changelog.md` - history of meaningful starter-pack changes.
- `templates/` - reusable project instruction and task brief templates.
- `templates/obsidian/` - note templates for project index, daily notes, decisions, research and handoff.
- `templates/starter-pack-improvement-note.md` - capture format for reusable improvement candidates.
- `templates/plugin-integration-plan.md` - project-level plan for selected plugins/connectors and approvals.
- `templates/agent-coordination-board.md` - Linear/GitHub/Jira/ClickUp board template for multiple Codex agents.
- `packs/binance-trading/` - Binance and crypto trading bot starter pack with safety-first MCP guidance.
- `scripts/install-starter-pack.ps1` - installer script for copying the pack into a project.
- `scripts/install-optional-memory-tools.ps1` - optional installer wrapper for Obsidian and Codebase Memory MCP.

## Install Into A Project

Clone the starter pack:

```powershell
git clone https://github.com/akhelasi/codex-starter-pack.git
cd codex-starter-pack
```

Copy it into a project:

```powershell
.\scripts\install-starter-pack.ps1 -TargetPath "D:\path\to\your-project"
```

If Windows blocks `.ps1` scripts with an execution policy error, run this one-time command instead:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-starter-pack.ps1 -TargetPath "D:\path\to\your-project"
```

Copy focused packs too when the project should receive `packs/`:

```powershell
.\scripts\install-starter-pack.ps1 -TargetPath "D:\path\to\your-project" -IncludePacks
```

Execution-policy-safe version:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-starter-pack.ps1 -TargetPath "D:\path\to\your-project" -IncludePacks
```

Install optional memory tools only when needed:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-optional-memory-tools.ps1 -InstallObsidian
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-optional-memory-tools.ps1 -InstallCodebaseMemory
```

The Codebase Memory command installs binary-only by default. Re-run with `-ConfigureCodebaseMemory` only after reviewing `docs/codebase-memory-mcp-research.md`.

Then tell Codex:

```text
Work in this project using AGENTS.md. Review .agents/skills and use only the skill, MCP server, or tool needed for the current task. Ask before GitHub write actions, deploys, database changes, or destructive operations.
```

## Recommended Default Use

- Use `senior-web-engineer` for serious multi-file web development.
- Use `adversarial-code-review` before pushing, deploying, or accepting substantial AI-generated code.
- Use `php-sql-safety-review` for PHP, SQL, forms, sessions, auth, and database work.
- Use `frontend-browser-qa` for UI, CSS, JavaScript, responsive layout, and browser checks.
- Use `github-pages-manager` for GitHub repositories, GitHub Pages, and static-site deployment.
- Use `controlled-file-editing` when editing starter-pack docs or when patch operations are slow.
- Review `docs/codebase-memory-mcp-research.md` before enabling Codebase Memory MCP for large-codebase graph search or impact analysis.

## MCP Policy

Keep MCP usage conservative:

- Good defaults: OpenAI Docs, Context7, Playwright/browser.
- Enable when needed: GitHub, Chrome DevTools, Fetch.
- Sensitive: database, filesystem, Figma, Sentry, Slack, Drive, Notion.

Use prompt approvals, read-only modes, and narrow toolsets when possible. Do not commit tokens or secrets.

## Notes

Generated experiments and test projects belong in `outputs/` and should not be copied into real projects unless explicitly requested.
