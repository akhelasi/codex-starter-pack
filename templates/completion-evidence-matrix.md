# Completion Evidence Matrix

Updated: YYYY-MM-DD

Use this before marking a long project complete. A requirement is complete only when the evidence below exists and has been reviewed.

## Evidence Rules

- Do not store real secrets in Git.
- Treat `WAITING` as incomplete.
- Store private screenshots, credentials, database exports and signoff evidence outside the repository.
- Do not use local green checks as proof of production readiness unless the requirement is explicitly local-only.

## Definition Of Done Evidence

| Requirement | Current Status | Evidence Needed | Verification Command Or Action | Where To Record Evidence |
| --- | --- | --- | --- | --- |
| Main pages render | TODO | Route/browser evidence |  | Worklog |
| Admin/data flows work | TODO | CRUD/manual QA evidence |  | Worklog or external QA note |
| Storage/database ready | WAITING | Migration/import/smoke evidence |  | Worklog or deployment note |
| Real content approved | WAITING | Client approval |  | External signoff |
| Manual browser QA complete | TODO | Desktop/mobile/keyboard notes |  | External QA note |
| Production launch ready | WAITING | Host checks, backup, credentials, final smoke |  | Deployment note |

## Completion Decision

The project can be marked complete only when every required row is `DONE` and the evidence is current for the final commit/deploy.
