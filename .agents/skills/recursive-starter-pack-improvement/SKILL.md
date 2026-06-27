---
name: recursive-starter-pack-improvement
description: Improve the Codex starter pack from repeated real project experience. Use when a project reveals a recurring problem, a better workflow, a safer MCP/tool policy, a reusable template, or a verified lesson that should become durable starter-pack guidance.
---

# Recursive Starter Pack Improvement

Use this skill when experience from a real project should improve the starter pack.

## Core Principle

Do not treat every project-specific fix as starter-pack guidance. Promote a lesson only when it is reusable, verified, and safe for future projects.

## Improvement Loop

1. Observe the problem or better workflow during real work.
2. Record the context: project type, task, failure mode, fix, verification, and remaining risk.
3. Decide whether the lesson is reusable across projects.
4. Choose the smallest durable surface:
   - `AGENTS.md` for global behavior rules.
   - `.agents/skills/*/SKILL.md` for repeatable workflows.
   - `docs/` for detailed guidance, research, or rationale.
   - `templates/` for reusable project files or prompts.
   - `.codex/config.example.toml` for MCP examples and safe defaults.
5. Keep project-private details out of the starter pack.
6. Verify the changed starter-pack files.
7. Update `docs/starter-pack-changelog.md`.
8. Push the clean starter-pack repository when appropriate.

## Promotion Criteria

Promote a lesson when at least one is true:

- The same issue happened more than once.
- The fix saved meaningful time or prevented risk.
- The lesson affects safety, secrets, data loss, deploys, GitHub, MCP, browser QA, PHP/SQL, or long-project handoff.
- The user explicitly asks to preserve the lesson for future Codex sessions.

Do not promote when:

- The detail is private to one client/project.
- The fix depends on a one-off environment quirk.
- The information contains secrets, credentials, private screenshots, production database data, or signoff evidence.
- The lesson is not verified yet; record it as a candidate instead.

## Verification

Before committing starter-pack improvements:

- Run `git diff --check` in the clean starter-pack repo.
- Scan for secrets: `gho_`, `github_pat_`, `sk-`, `BEGIN PRIVATE KEY`, `password=`, `token=`, `secret=`.
- Confirm excluded project/product files were not copied.
- Read new docs/templates to ensure they are generic and reusable.

## Final Response

State what lesson was promoted, which starter-pack files changed, verification performed, and whether the GitHub starter-pack repo was pushed.
