# Codex Starter Pack for Web Development

This repository is a portable Codex starter pack for web projects using HTML, CSS, JavaScript, PHP, SQL, GitHub Pages, XAMPP, and PHP hosting.

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
- `docs/starter-pack-changelog.md` - history of meaningful starter-pack changes.
- `templates/` - reusable project instruction and task brief templates.
- `scripts/install-starter-pack.ps1` - installer script for copying the pack into a project.

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

## MCP Policy

Keep MCP usage conservative:

- Good defaults: OpenAI Docs, Context7, Playwright/browser.
- Enable when needed: GitHub, Chrome DevTools, Fetch.
- Sensitive: database, filesystem, Figma, Sentry, Slack, Drive, Notion.

Use prompt approvals, read-only modes, and narrow toolsets when possible. Do not commit tokens or secrets.

## Notes

Generated experiments and test projects belong in `outputs/` and should not be copied into real projects unless explicitly requested.
