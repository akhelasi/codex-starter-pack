---
name: plugin-integration-planner
description: Plan how Codex should use plugins, apps/connectors, and external work systems in a project. Use when the user asks which plugins to use, how to connect GitHub, Linear, Slack, Gmail, Drive, Figma, Vercel, Supabase, security, analytics, or other tools to a starter pack, or how multiple Codex agents should coordinate through external tools.
---

# Plugin Integration Planner

Use this skill to choose the smallest useful plugin/tool set for a project.

## Workflow

1. Identify the project domain and primary starter pack.
2. Identify the source of truth for code, tasks, docs, design, deploy, data, and communication.
3. Select only the plugins needed for the current workflow.
4. Classify access risk before enabling a connector.
5. Add a short tool plan to the project brief or worklog.
6. For multi-agent work, define where agents record status, blockers, ownership, and handoff notes.

## Default Tool Roles

- GitHub: source code, issues, PRs, reviews, CI, releases.
- Linear/Jira/ClickUp: task board and multi-agent coordination.
- Drive/SharePoint/Notion/Confluence: requirements, client docs, decisions, knowledge base.
- Figma/MagicPath: design source for frontend implementation.
- Slack/Gmail/Calendar/Outlook: communication context, meeting follow-up, draft replies.
- Vercel/Supabase/Sentry: deploy, backend/database platform, production diagnostics.
- Codex Security: security review and vulnerability remediation.
- Computer Use/browser: visual/manual QA when code-level checks are not enough.
- Binance/Game Studio/Data Visualization/Temporal: domain-specific packs or workflows.

## Safety Rules

- Do not connect private workspace plugins by default.
- Prefer read-only or narrow access first.
- Ask before tools can message people, change tasks, deploy, mutate databases, trade, or access private documents.
- Never copy secrets, private messages, customer data, or account data into starter-pack docs.

## Multi-Agent Coordination Pattern

Use Linear, Jira, GitHub Issues, or ClickUp as the shared board when more than one Codex thread/agent is working.

Each agent should record:

- Issue/task id.
- Owner/thread name.
- Current status: `TODO`, `IN_PROGRESS`, `WAITING`, `REVIEW`, `DONE`.
- Files or area touched.
- Last verified check.
- Blockers and next action.
- Links to PRs, commits, screenshots, logs, or handoff notes.

## Final Response

State selected plugins, why each is useful, which were intentionally not used, required approvals, and where the tool plan was recorded.
