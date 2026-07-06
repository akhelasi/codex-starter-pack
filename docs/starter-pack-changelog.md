# Starter Pack Changelog

This file records what changed in this starter pack and why, so future Codex threads do not need the same context explained again.

## 2026-06-19 - Initial Web Development Starter Pack

### Added

- `AGENTS.md`
- `.codex/config.example.toml`
- `.agents/skills/web-project-workflow/SKILL.md`
- `.agents/skills/php-sql-safety-review/SKILL.md`
- `.agents/skills/frontend-browser-qa/SKILL.md`
- `docs/mcp-and-skills-research.md`
- `docs/setup-checklist.md`
- `templates/project-agents.md`
- `templates/task-brief.md`
- `README.md`

### Why

The user wants Codex to work better with HTML, CSS, JavaScript, PHP, SQL, and general website projects. The pack gives Codex durable project rules, reusable skills, setup notes, and MCP recommendations.

### Notes

- `AGENTS.md` is meant to be copied into web project roots.
- Skills are repo-scoped under `.agents/skills`.
- MCP config is an example only; real secrets must not be committed.
- The provided ChatGPT share link could not be reliably accessed through tooling, so the first version was based on the user's description plus current public docs.

## 2026-06-19 - GitHub and GitHub Pages Management

### Added

- `.agents/skills/github-pages-manager/SKILL.md`
- `docs/github-management.md`

### Updated

- `README.md`
- `docs/setup-checklist.md`
- `templates/project-agents.md`

### Why

The user explained that they have GitHub account `akhelasi` and an existing repo `akhelasi/Tracers`, where multiple sites were uploaded because GitHub Pages and new repo deployment were confusing. The starter pack now tells Codex to help manage GitHub repository organization, GitHub Pages setup, and safe migration away from one mixed repository when appropriate.

### Decisions

- Prefer one repository per separate website.
- Keep the existing `Tracers` site working until replacements are verified.
- Use GitHub Pages for static HTML/CSS/JS sites.
- Do not use GitHub Pages for PHP/SQL runtime because GitHub Pages does not execute server-side PHP or run databases.
- For PHP/SQL projects, use GitHub for source control and use PHP-capable hosting for public production deployment.

## 2026-06-19 - PHP/SQL Local Development With XAMPP

### Updated

- `docs/github-management.md`
- `docs/setup-checklist.md`
- `README.md`

### Why

The user noted that paid PHP hosting should wait until a site is ready. During development, PHP/SQL projects should run locally on the user's computer with XAMPP.

### Decisions

- During development, PHP/SQL sites should run locally with XAMPP: Apache + PHP + MySQL/MariaDB.
- GitHub remains the code history and backup.
- Public PHP hosting is only needed when the site is ready to publish.
- Typical local URL examples:
  - `http://localhost/project-name/`
  - `http://localhost:8080/`

### Workflow

```text
Edit code locally
        |
Test with XAMPP
        |
Commit and push to GitHub
        |
Deploy to PHP hosting only when ready for public release
```

## 2026-06-20 - GitHub CLI Access

### Changed

- Installed GitHub CLI with the official `GitHub.cli` winget package.
- Authenticated GitHub CLI as `akhelasi`.
- Verified read access to `https://github.com/akhelasi/Tracers`.

### Why

The user wants Codex to manage GitHub setup, repositories, GitHub Pages, and future project publishing instead of doing those steps manually.

### Notes

- GitHub CLI works in the real Windows user context.
- The sandbox context may report the keyring token as invalid, so Codex should run GitHub CLI actions with approval/escalated execution when needed.
- Current verified `Tracers` repository details: public repo, default branch `master`.

## 2026-06-20 - GitHub Pages Test Project

- Created local test project `outputs/codex-test-page`.
- Created public GitHub repo `https://github.com/akhelasi/codex-test-page`.
- Enabled GitHub Pages from `main` branch root.
- Verified live URL: `https://akhelasi.github.io/codex-test-page/`.

## 2026-06-20 - Starter Pack GitHub Repository

- Added `scripts/install-starter-pack.ps1`.
- Added `docs/clone-and-install.md`.
- Published clean starter pack repo: `https://github.com/akhelasi/codex-starter-pack`.
- Included `AGENTS.md`, `.agents`, `.codex`, `docs`, `templates`, and `scripts`.
- Excluded generated `outputs` test projects and local cache files.

## 2026-06-22 - Senior Codex Engineering Workflow

- Added `.agents/skills/senior-web-engineer/SKILL.md`.
- Added `.agents/skills/adversarial-code-review/SKILL.md`.
- Added `docs/senior-codex-engineering-playbook.md`.
- Adapted Karpathy/Claude Code agentic coding practices to Codex: explore, plan, implement, verify, review, and publish.
- Kept MCP recommendations conservative: official docs, Context7, Playwright/browser, GitHub, Chrome DevTools, and local/dev database only when needed.

## 2026-06-22 - Local MCP Configuration

- Added global MCP configs for OpenAI Docs, Context7, Playwright, Chrome DevTools, GitHub, and Fetch.
- Verified GitHub CLI remains authenticated as `akhelasi`.
- Noted that new MCP tools may require Codex restart/new thread before appearing in tool discovery.
- Did not install sensitive project-specific MCPs such as production database, filesystem, Figma, Sentry, Slack, Drive, or Notion.

## 2026-06-22 - Sensitive MCP Defaults In AGENTS

- Added `Sensitive MCP Defaults` to `AGENTS.md`.
- Recorded that production database, broad filesystem, Figma, Sentry, Slack, Drive, Notion, and similar private-workspace MCP servers should not be installed by default.
- These MCPs should be enabled only for project-specific needs with user approval and narrow/read-only scopes where possible.

## 2026-06-22 - Work Computer Setup Prompt

- Added a work-computer setup prompt to `docs/clone-and-install.md`.
- The prompt tells Codex how to clone `https://github.com/akhelasi/codex-starter-pack`, check Git/Node/GitHub CLI/Codex CLI, run the install script, and avoid sensitive MCP servers without approval.

## 2026-06-26 - Lessons From Banza PHP/MySQL Site Build

### Added

- `docs/starter-pack-lessons-from-banza.md`
- `templates/project-checklist.md`
- `templates/project-worklog.md`
- `templates/completion-evidence-matrix.md`
- `templates/codex-continuation-prompt.md`

### Updated

- `AGENTS.md`
- `.agents/skills/web-project-workflow/SKILL.md`
- `.agents/skills/php-sql-safety-review/SKILL.md`
- `.agents/skills/frontend-browser-qa/SKILL.md`
- `docs/setup-checklist.md`
- `docs/tooling-stability.md`
- `templates/task-brief.md`

### Why

The Banza village site was a long phased PHP/MySQL project with public pages, admin CRUD, uploads, JSON-to-MySQL migration, launch readiness checks, manual QA blockers, GitHub handoff and XAMPP local serving. The starter pack now records the practical lessons from that work.

### Decisions

- Long projects should maintain a checklist, worklog, completion evidence matrix and continuation prompt.
- Default handoff checks should be safe and non-destructive.
- Production, migration, external-service and host-only checks should be explicit.
- Demo-ready and production-ready states must be kept separate.
- Browser automation blockers should be documented and handled with route/DOM/manual QA fallback evidence.
- Starter-pack documentation edits should use small controlled patches when the sandbox is unstable.

## 2026-06-27 - Obsidian-Compatible Project Knowledge

- Added `.agents/skills/obsidian-project-knowledge/SKILL.md`.
- Added `docs/obsidian-codex-workflow.md`.
- Added `templates/obsidian/` note templates for project index, daily notes, decision notes, research notes and handoff notes.
- Documented an Obsidian-style Markdown vault workflow for Codex: linked small notes, project memory, decisions, WAITING blockers, verification evidence and continuation prompts.
- Kept security guidance explicit: private client evidence, credentials, production DB details and signoff artifacts should stay outside Git.

## 2026-06-27 - Recursive Starter Pack Improvement

- Added `.agents/skills/recursive-starter-pack-improvement/SKILL.md`.
- Added `docs/recursive-starter-pack-improvement.md`.
- Added `templates/starter-pack-improvement-note.md`.
- Added `Starter Pack Self-Improvement` guidance to `AGENTS.md`.
- The starter pack now records how to promote repeated, verified, reusable project lessons back into skills, docs, templates, MCP config or AGENTS guidance without copying private/project-specific data.

## 2026-06-27 - Multi Starter Pack Hub Plan

- Added `.agents/skills/starter-pack-router/SKILL.md`.
- Added `docs/multi-starter-pack-hub.md`.
- Sent a detailed background prompt to the existing `Ã¡Æ’â€™Ã¡Æ’ÂÃ¡Æ’ÂÃ¡Æ’Â£Ã¡Æ’â€ºÃ¡Æ’Â¯Ã¡Æ’ÂÃ¡Æ’â€˜Ã¡Æ’â€Ã¡Æ’Â¡Ã¡Æ’â€ Binance grid` thread asking it to create a Binance/trading-focused starter pack with recursive improvement, API/secrets safety, backtesting, paper/testnet defaults and live-trading approval gates.
- Documented the plan to eventually keep web, Binance/trading and Unity/C# game starter packs in one hub and route Codex work to the right pack.

## 2026-06-27 - Large Patch Stall Recovery

- Generalized the `controlled-file-editing` skill beyond web/starter-pack docs so it applies to any project where large multi-file patches or documentation edits stall.
- Updated `docs/tooling-stability.md` with a reusable diagnostic: if a broad `apply_patch` appears stuck but smaller reads/status checks work, treat patch size/tooling as the likely blocker and retry with one-file or one-section patches.
- Added the same rule to `AGENTS.md` so future Codex sessions see it during initial project instructions.

### Why

The Binance trading-bot thread hit the same failure pattern: a very large multi-file `apply_patch` stalled, then the work completed after switching to smaller patches. This is a cross-project tooling lesson, not a Binance-only or web-only rule.

## 2026-06-28 - Initial Binance Trading Starter Pack

- Added `packs/binance-trading/` as the first focused non-web starter pack.
- Added Binance/trading skills for bot workflow, MCP safety review, and strategy/backtest review.
- Added research notes covering official Binance docs/connectors, CCXT, Freqtrade, Hummingbot, and community Binance/CCXT MCP candidates.
- Added a conservative trading MCP install policy, commented config examples, and a pack-local `.gitignore` for secrets/private trading data.
- Kept trade-capable MCPs disabled by default because they can access account data or place/cancel orders.

### Why

The user wants multiple starter packs in one workspace and asked for Binance/crypto trading research, skills, MCP guidance, and documentation. The safe default is documentation plus opt-in review gates, not automatic installation of exchange-access MCPs.

## 2026-07-06 - Plugin Integration And Multi-Agent Coordination

- Added `.agents/skills/plugin-integration-planner/SKILL.md`.
- Added `docs/plugin-integration-playbook.md`.
- Added `templates/plugin-integration-plan.md`.
- Added `templates/agent-coordination-board.md`.
- Updated `AGENTS.md`, `README.md`, `docs/setup-checklist.md`, `docs/file-maintenance-guide.md`, `docs/skills-mcp-security-review.md`, and `templates/task-brief.md`.

### Why

The user wanted the starter pack to explain when plugins such as GitHub, Linear, Slack, Gmail, Drive, Figma, Vercel, Supabase, Computer Use, Binance, Game Studio, data visualization, and security tools should be used. The new guidance also records a Linear/GitHub/Jira/ClickUp board pattern for multiple Codex agents working in parallel, so each agent can see what others did, what they are doing, and what remains blocked.
