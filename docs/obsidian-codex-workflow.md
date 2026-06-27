# Obsidian + Codex Workflow

Verified: 2026-06-27.

This starter-pack workflow adapts Obsidian-style linked Markdown notes for Codex projects.

## Research Summary

Obsidian stores notes as local Markdown files in a vault. Its useful coding-workflow features are not magic: they are plain text notes, internal links, backlinks, graph/local graph, daily notes and templates. That makes it a good companion for Codex because Codex can read and update Markdown without needing the Obsidian app to be open.

Claude Code workflows often use persistent instruction files and memory. The Codex equivalent in this starter pack is:

- `AGENTS.md` for durable project rules.
- `.agents/skills/` for reusable workflows.
- `docs/` for project handoff, setup and evidence.
- Obsidian-compatible notes for daily context, linked decisions and research trails.

## When To Use It

Use an Obsidian-style knowledge layer when:

- The project lasts more than one or two Codex sessions.
- There are many decisions, blockers, content sources, credentials, hosting steps or QA phases.
- You need to remember why a decision was made, not only what code changed.
- You want daily notes or a project diary that can be opened in Obsidian and read by Codex.

Skip it for tiny one-file tasks.

## Recommended Folder

Inside a project, create `notes/` when the notes are safe to keep in Git.

Use an external/private Obsidian vault when notes contain client-private information, real credentials, private screenshots, production DB details, payment/contact details or signoff evidence.

Suggested structure:

```text
notes/
  00-index/
    Project Index.md
  10-daily/
    2026-06-27.md
  20-decisions/
    Decision - Storage Model.md
  30-research/
    Research - Hosting Options.md
  40-handoff/
    Continuation Prompt.md
    Completion Evidence.md
  90-archive/
```

## Note Types

- Project index: map of active notes, current status and next action.
- Daily note: what changed today, verification, blockers and next step.
- Decision note: context, options, chosen direction, tradeoffs and evidence.
- Research note: source-backed findings with dates and links.
- Handoff note: what Codex should read next, what is DONE/TODO/WAITING, and what must not be touched.

## Linking Pattern

Use Obsidian links:

```md
Related: [[Project Index]], [[Decision - Storage Model]], [[2026-06-27]]
```

Use tags sparingly:

```md
#status/waiting #area/database #phase/launch
```

Prefer links over duplicating the same explanation in many files.

## Codex Prompt

```text
Use AGENTS.md. Also use the Obsidian-compatible notes in notes/ as project memory. Start from notes/00-index/Project Index.md if it exists. Read only notes relevant to this task. Update the daily note, decision note, or handoff note when the task changes project status, decisions, blockers, verification, or next actions. Do not store secrets or private client evidence in Git.
```

## Safety Rules

- Notes are context, not proof. Production readiness still needs verification commands, host evidence or user signoff.
- Keep private evidence outside Git.
- Record source links and dates for research notes.
- Use `WAITING` for missing client/hosting/provider/manual-QA items instead of treating them as code bugs.
- Do not let notes become a giant dump. Link small notes together.

## Source Links

- Obsidian Help: https://obsidian.md/help/
- Link notes and backlinks: https://obsidian.md/help/link-notes
- Daily notes: https://obsidian.md/help/plugins/daily-notes
- Claude Code memory model: https://code.claude.com/docs/en/memory
- Claude Code best practices: https://code.claude.com/docs/en/best-practices
- OpenAI Codex skills: https://developers.openai.com/codex/skills
