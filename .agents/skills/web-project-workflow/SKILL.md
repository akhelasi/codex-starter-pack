---
name: web-project-workflow
description: Plan, implement, and verify website changes in HTML, CSS, JavaScript, PHP, and SQL projects. Use when Codex is asked to build a page, fix a UI bug, add a PHP feature, wire forms, update database-backed behavior, or improve an existing website.
---

# Web Project Workflow

Use this workflow for practical website work.

## Workflow

1. Inspect the project structure with `rg --files`.
2. Identify the framework or pattern before editing.
3. Find the entry points: routes, templates, scripts, styles, database layer, and config examples.
4. Make the smallest implementation that satisfies the request.
5. Keep frontend, backend, and SQL changes consistent.
6. Verify changed PHP syntax with `php -l` when available.
7. Run existing project checks when they are discoverable.
8. For visible UI changes, verify in a browser when possible.

## Long Project Phase Workflow

Use this when the work spans many phases, pages, admin flows, database changes, or deployment steps.

1. Create or update a project checklist with `DONE`, `TODO`, `WAITING`, `PROBLEM`, `REVIEW`, and `RETHINK` statuses.
2. Keep a worklog that records what changed, how it was verified, bugs found, fixes applied, and what the next phase should remember.
3. Add a safe local handoff command once checks become scattered. The default command should avoid destructive migrations, production credentials, external services, and host-only actions.
4. Separate demo-ready from production-ready. Do not treat seed content, placeholder accounts, local JSON storage, or local browser checks as proof of production launch readiness.
5. For every production blocker, name the missing evidence: client approval, hosting details, database smoke result, real credentials, provider API, manual QA signoff, or backup proof.

## Implementation Rules

- Preserve existing code style.
- Use semantic HTML and accessible labels.
- Keep CSS responsive and avoid layout shifts.
- Use prepared SQL statements for user-controlled values.
- Escape server-rendered output in the correct context.
- Include loading, empty, and error states for async UI.
- Do not add dependencies without a clear project-level reason.
- For XAMPP PHP projects, prefer serving the project through Apache and verifying the localhost URL. Use a junction/symlink into `htdocs` when appropriate instead of copying source files.
- If browser automation is blocked, document the blocker and use route smoke, rendered DOM checks, and a manual QA checklist as fallback evidence. Do not claim visual QA is complete without a real browser pass.

## Final Response

Summarize changed files, verification performed, and any checks that could not run.
