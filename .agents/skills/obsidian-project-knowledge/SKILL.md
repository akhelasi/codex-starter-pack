---
name: obsidian-project-knowledge
description: Maintain an Obsidian-compatible project knowledge layer for Codex work. Use when the user wants Obsidian, a Markdown vault, linked notes, daily notes, project logs, decisions, blockers, research notes, or long-term project memory that Codex can read without re-explanation.
---

# Obsidian Project Knowledge

Use this skill when a project benefits from a Markdown knowledge vault or Obsidian workflow.

## Purpose

Keep durable project context in small linked Markdown notes so Codex can recover context across long sessions without the user re-explaining decisions, blockers, research, or handoff state.

## Recommended Vault Shape

Use a project-local folder such as `notes/` or an external Obsidian vault. If the notes include private client content, credentials, screenshots, signoff evidence, or contact/payment data, keep that vault outside Git.

Suggested folders:

- `00-index/` - map of contents and project dashboard notes.
- `10-daily/` - daily work notes.
- `20-decisions/` - architecture and product decisions.
- `30-research/` - source-backed research notes.
- `40-handoff/` - continuation prompts, blocker summaries and launch evidence.
- `90-archive/` - old notes kept for history.

## Linking Rules

- Use Obsidian-style links such as `[[Project Index]]`, `[[Decision - Storage Model]]`, and `[[2026-06-27]]`.
- Every daily note should link to the project index and any relevant decision/blocker notes.
- Every decision note should link to evidence, affected files, and follow-up tasks.
- Keep notes small enough that Codex can read only the relevant note.

## What To Record

- Current project status.
- Decisions and why they were made.
- WAITING blockers: client content, hosting, credentials, providers, manual QA, production DB access.
- Verification evidence and commands.
- Research notes with source links and dates.
- Continuation prompts for the next Codex session.

## What Not To Record In Git

- Tokens, passwords, API keys, private database dumps, production config, private signoff screenshots, real credentials, or private client payment/contact data.

## Codex Workflow

1. Read `AGENTS.md` first.
2. Read the project index note if one exists.
3. Read only the notes relevant to the current task.
4. Update daily/worklog notes after meaningful phases.
5. Add or update decision notes when architecture, storage, deployment, or data model changes.
6. Do not claim production readiness from notes alone; verify with commands or user-provided evidence.
