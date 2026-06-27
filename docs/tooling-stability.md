# Tooling Stability Notes

This workspace and related project threads have shown repeated slowdowns when using large `apply_patch` operations on Markdown files or broad multi-file edits. Some sandbox contexts also expose `.agents` and `.codex` as read-only, so skill or config edits may require scoped escalation.

## Current Mitigation

- Prefer small one-file edits.
- Avoid large multi-file patches.
- If a large multi-file `apply_patch` stalls, treat the patch size as the likely tooling problem first. Retry as smaller patches by file or section.
- Verify every edit immediately.
- If patching stalls for more than about 60 seconds, stop and report status.
- Use the `controlled-file-editing` skill for starter-pack documentation edits.
- Request scoped escalation when editing `.agents` or `.codex` is denied by sandbox permissions.
- Avoid putting migration/setup scripts inside default aggregate checks if those commands behave differently in the sandbox. Make them opt-in and document where to run them safely.
- When browser tooling fails due to local permissions, capture the exact error and use fallback route/DOM/manual QA evidence instead of retrying blindly.

## Fallback Policy

A controlled write fallback may be used for generated starter-pack documentation when `apply_patch` itself is the blocker. Fallback writes must stay inside the workspace and must be verified by reading the file afterward.

Do not use fallback writes for secrets, credentials, destructive operations, or unclear user requests.

## Large Patch Stall Diagnostic

Symptom: Codex appears stuck while applying a broad documentation or multi-file patch, but smaller shell reads and git status checks still work.

Likely cause: the edit operation is too large or complex for the current patch tooling, not necessarily a code or repository problem.

Recovery:

1. Stop waiting after about 60 seconds and tell the user what is happening.
2. Re-check `git status --short` to confirm whether a partial edit landed.
3. Split the work into one-file or one-section patches.
4. Read each changed file after editing.
5. Continue only after the changed file matches the intended content.

This pattern is reusable across web projects, trading bots, game projects, and starter-pack maintenance.
