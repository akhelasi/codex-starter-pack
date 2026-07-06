# Plugin Integration Playbook

Use this playbook when deciding which Codex plugins, apps/connectors, MCPs, or external services should be connected to a project.

## Core Principle

Do not connect every useful-looking plugin. Connect the smallest set that gives Codex the right context or action surface for the current project phase.

## Access Tiers

| Tier | Access | Examples | Default |
| --- | --- | --- | --- |
| 0 | Documentation or public data | docs, public market data, public GitHub repos | Safe default |
| 1 | Private read-only context | Drive docs, Figma files, Linear issues, GitHub repo read | Ask when private workspace data is involved |
| 2 | Write collaboration actions | create/update issues, draft messages, comments, PRs | Ask before enabling writes |
| 3 | Deploy/data mutation | Vercel deploy, Supabase migrations, production config | Explicit approval per project |
| 4 | Money, security, identity, live systems | Binance trading, credentials, security changes, withdrawals | Block by default; exact-action approval |

## Source Of Truth Model

For serious projects, decide where each type of truth lives:

- Code: GitHub repository.
- Tasks: Linear, GitHub Issues, Jira, or ClickUp.
- Product/client knowledge: Drive, SharePoint, Notion, or Confluence.
- Design: Figma or MagicPath.
- Deployment: Vercel, hosting panel, GitHub Actions, or another deploy tool.
- Production issues: Sentry, logs, support inbox, or security scanner.
- Handoff/memory: Obsidian-style notes and starter-pack templates.

Record this in `templates/plugin-integration-plan.md` or the project worklog.

## Plugin Use Matrix

| Plugin / connector | Use when | Starter-pack integration idea | Risk notes |
| --- | --- | --- | --- |
| GitHub | Code is on GitHub, PRs/issues/Actions matter, or Codex must publish/review code | Pair with `github-pages-manager`, project checklist, PR template, and changelog | Ask before push, PR comments, releases, Pages/deploy changes |
| Linear | Multiple agents/threads or phases need a shared task board | Use as live agent board: one issue per task, status/owner/blocker/check fields | Ask before creating/updating tasks in a real workspace |
| Jira / Atlassian Rovo | Company uses Jira/Confluence | Same as Linear, plus Confluence requirements as knowledge source | Private company data; keep links, not copied secrets |
| ClickUp | Team uses ClickUp for tasks/docs | Lightweight task board and project phase tracker | Same write/private-data approvals as Linear |
| Slack | Team decisions, blockers, or support context are in Slack | Summarize relevant threads into project worklog; draft status updates | Do not read broad channels unnecessarily or post without approval |
| Gmail / Outlook | Client requirements or approvals arrive by email | Extract requirements and draft replies; record decisions in notes | Private mail; avoid copying sensitive message bodies into Git |
| Google Calendar / Outlook Calendar | Meetings drive tasks or deadlines | Convert meeting agenda/actions into checklist/worklog | Calendar data is private; ask before invites/changes |
| Google Drive | Specs, assets, docs, Sheets, or client files live in Drive | Link docs into project brief; summarize only task-relevant parts | Do not commit private docs or broad exports |
| SharePoint | Work files live in Microsoft 365 | Same as Drive for company environments | Treat as sensitive internal data |
| Notion | Product docs, decisions, or task databases are in Notion | Use as external knowledge base; mirror durable decisions into project notes | Ask before editing pages/databases |
| Figma | UI must match a design | Pair with `frontend-browser-qa`; create design implementation checklist | Need exact frame/page; do not infer missing specs as final |
| MagicPath | Design-to-code or UI generation workflow is available | Use for fast UI scaffolding, then verify manually/browser | Review generated UI carefully; still follow project CSS patterns |
| Computer Use | Need to inspect or operate desktop/browser GUI | Use for visual QA, desktop app setup, screenshots, blocked browser flows | Ask before sensitive accounts or destructive UI actions |
| Vercel | Project deploys to Vercel | Add deploy checklist, env variable checklist, preview URL verification | Ask before env/deploy changes |
| Supabase | Project uses Supabase DB/auth/storage/functions | Add database/schema/migration checklist and local/dev policy | Treat schema/data mutation as high risk |
| Sentry | Production errors or performance issues matter | Add bug triage workflow: issue -> reproduction -> fix -> release evidence | Contains private stack traces/user context |
| Codex Security | Project needs vulnerability review | Run before release or after auth/payment/data changes | Security findings can be sensitive; avoid public leakage |
| Build Web Data Visualization | Need dashboard/report from CSV/API/Sheets | Pair with data templates and web pack if building dashboard UI | Verify data quality and source definitions |
| Template Creator | Repeated Word/Excel/PowerPoint docs should become reusable templates | Convert recurring client docs into templates or skills | Remove private data before making reusable assets |
| Airtable | Airtable is the operational database/source | Use for lightweight CMS/task/data workflows | Ask before edits; document schema assumptions |
| Temporal | Project uses Temporal workflows | Use for workflow debugging, orchestration review, retry/failure analysis | Production workflow changes are high risk |
| Binance | Crypto market data or trading workflow | Route to `packs/binance-trading/`; keep trading MCPs opt-in | Live trading and account access require exact approval |
| Game Studio | Game prototype/assets/game logic | Route to future Unity/game pack | Keep assets/licensing and build verification explicit |

## Multi-Agent Board Pattern

Use Linear, Jira, ClickUp, or GitHub Issues when several Codex threads/agents work in parallel.

Recommended issue fields:

- `Owner`: agent/thread name.
- `Status`: `TODO`, `IN_PROGRESS`, `WAITING`, `REVIEW`, `DONE`.
- `Scope`: files, module, page, or feature.
- `Inputs`: docs/design/API access needed.
- `Output`: PR, commit, artifact, screenshot, or report.
- `Verification`: last command/check/browser evidence.
- `Blocker`: external dependency or approval needed.
- `Next`: the next concrete action.

Agent protocol:

1. Claim one issue before editing.
2. Write intended scope before starting.
3. Update status and blocker when waiting.
4. Link commit/PR/check evidence after finishing.
5. Leave a handoff note if another agent should continue.

## Recommended Starter-Pack Improvements

- Add a `plugin-integration-plan.md` template to every substantial project.
- For team or multi-agent work, create a Linear/GitHub Issues/Jira/ClickUp board at project start using `templates/agent-coordination-board.md`.
- For client projects, define the knowledge source: Drive, SharePoint, Notion, or email.
- For frontend projects, add a design source field: Figma, MagicPath, screenshot, or no design.
- For production projects, add deploy/observability/security fields: Vercel, Sentry, Codex Security.
- For trading projects, route to the Binance pack and keep trade-capable tools disabled until approved.

## Approval Prompts

Use short prompts like:

```text
This connector can read private workspace data. I only need read access to the specific project/source listed below. Do you approve?
```

```text
This action can write to an external system. I will update only these issues/comments/deploy settings. Do you approve?
```

```text
This tool can affect live systems or money. I will not run it until you approve the exact action, target, and rollback plan.
```
