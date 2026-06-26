# Codex Continuation Prompt

Use this prompt when continuing a long project in a new Codex session.

```text
Work in this project using AGENTS.md.

First read:
- AGENTS.md
- README.md
- docs/project-checklist.md
- docs/project-worklog.md
- docs/completion-evidence-matrix.md

Current state:
- Summarize what is implemented.
- Summarize what is not complete.
- Summarize external WAITING blockers.

Workflow:
1. Inspect git status.
2. Continue from docs/project-checklist.md.
3. After each phase, verify, fix found issues, re-run checks, update docs/project-worklog.md and docs/project-checklist.md.
4. Do not commit secrets, production config, database dumps, real credentials, private payment/contact data or runtime uploads.
5. Do not mark the full project complete until docs/completion-evidence-matrix.md proves completion.

Useful local checks:
- Add commands here.

Host-only or production-only checks:
- Add commands here.
```
