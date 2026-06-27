# Recursive Starter Pack Improvement

Updated: 2026-06-27

The starter pack is meant to improve from real Codex project experience. When Codex runs into a repeated problem, finds a safer workflow, or discovers a better reusable pattern, that lesson should be captured and promoted into the starter pack deliberately.

## Why This Exists

Long projects reveal issues that are hard to predict up front: browser tooling failures, GitHub handoff gaps, PHP/SQL launch blockers, XAMPP quirks, patch/edit instability, project memory problems, and unclear production evidence. If these lessons stay only in chat history, the next project repeats the same cost.

## Improvement Pipeline

1. Capture the lesson in the project where it happened.
2. Separate project-specific facts from reusable guidance.
3. Confirm the lesson is verified or label it as a candidate.
4. Choose the right starter-pack surface.
5. Update only the smallest necessary files.
6. Verify no private/project-only data was copied.
7. Update `docs/starter-pack-changelog.md`.
8. Push `akhelasi/codex-starter-pack` when the improvement is clean.

## Where Lessons Belong

| Lesson type | Starter-pack destination |
| --- | --- |
| Global Codex behavior | `AGENTS.md` |
| Repeatable workflow | `.agents/skills/*/SKILL.md` |
| Detailed explanation or rationale | `docs/` |
| Reusable project note/checklist/prompt | `templates/` |
| MCP recommendation or tool policy | `docs/skills-mcp-security-review.md`, `.codex/config.example.toml` |
| Installation or handoff workflow | `docs/clone-and-install.md`, `docs/setup-checklist.md` |
| Known tooling issue | `docs/tooling-stability.md` |

## Lesson Statuses

Use these statuses when a lesson is not ready to become a permanent rule:

- `CANDIDATE`: observed once, may be useful.
- `REPEATED`: observed more than once or across projects.
- `VERIFIED`: fix was tested and worked.
- `PROMOTED`: copied into starter-pack docs/skills/templates.
- `REJECTED`: too project-specific, risky, or not general.

## Safety Rules

Never promote private project details into the public starter pack:

- credentials, tokens, passwords, API keys
- real client private content
- production database dumps or config
- private screenshots/signoff evidence
- personal contact/payment data
- host-only commands that could mutate production by default

Use placeholders and general language instead.

## Review Checklist

Before committing an improvement:

- Is this reusable beyond one project?
- Is it verified, repeated, or explicitly requested by the user?
- Is the destination file the smallest correct surface?
- Did we avoid copying project-only product files?
- Did `git diff --check` pass?
- Did sensitive scan pass?
- Did changelog record why the starter pack changed?

## Prompt For Future Codex

```text
If this project reveals a repeated problem, verified fix, safer workflow, or better reusable pattern, capture it as a starter-pack improvement candidate. Do not copy private/project-specific data. Promote only reusable lessons into AGENTS.md, .agents/skills, docs, templates, or .codex/config.example.toml, then verify and update docs/starter-pack-changelog.md.
```
