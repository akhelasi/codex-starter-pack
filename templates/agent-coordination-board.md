# Agent Coordination Board

Use this when multiple Codex threads, agents, or people work on the same project.

Recommended tools: Linear, GitHub Issues, Jira, or ClickUp.

## Board Rules

- One task per issue.
- One active owner per issue.
- Every agent updates the issue before starting and after finishing.
- Blockers use `WAITING`, not silent inactivity.
- Commits, PRs, screenshots, logs, and handoff notes are linked back to the issue.

## Status Values

- `TODO`: ready to start.
- `IN_PROGRESS`: one agent is actively working.
- `WAITING`: blocked by access, approval, external data, credentials, review, or another task.
- `REVIEW`: work is done and needs validation.
- `DONE`: verified and accepted.
- `RETHINK`: current approach needs redesign.

## Issue Template

Title:

Owner / thread:

Goal:

Scope:

Files / areas:

Inputs needed:

Current status:

Last update:

Verification:

Blockers:

Next action:

Links:

- Commit:
- PR:
- Screenshot:
- Log:
- Handoff note:

## Agent Start Update

```text
Claiming this task.
Scope: ...
Plan: ...
Expected output: ...
Risk/approval needed: ...
```

## Agent Finish Update

```text
Finished current pass.
Changed: ...
Verified: ...
Remaining blocker/risk: ...
Next action: ...
Links: ...
```
