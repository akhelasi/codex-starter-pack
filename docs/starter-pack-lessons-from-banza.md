# Starter Pack Lessons From Banza

Updated: 2026-06-26

These notes capture what should improve in the starter pack after building the Banza village PHP/MySQL site. They are meant to help future Codex sessions avoid repeat work, unclear handoffs, and expensive verification loops.

## What Worked Well

- Keeping a project checklist and worklog made long phased work recoverable after context compaction.
- A single local handoff command was much easier to trust than a scattered list of manual checks.
- Separating local/demo JSON storage from production MySQL made content approval possible before hosting existed.
- Treating real client content, hosting, credentials, camera streams, SMTP and manual QA as `WAITING` blockers kept the code work honest.
- Dedicated handoff docs helped distinguish "code exists" from "production launch is proven."

## Problems Encountered

### Large Markdown Edits Were Expensive

Large multi-file `apply_patch` operations on documentation sometimes became slow or fragile.

Better pattern:

- Use small, focused patches.
- Edit one topic at a time.
- Verify the changed file immediately.
- Use `controlled-file-editing` when starter-pack docs are being updated or when patching stalls.

### Verification Was Initially Too Spread Out

PHP syntax, JSON parsing, JS checks, import dry-runs, route smoke, readiness checks and content audit were documented in different places.

Better pattern:

- Add a project-local "handoff runner" script early.
- Keep destructive or environment-sensitive checks opt-in.
- Make the default runner safe for Codex sandbox and normal local development.
- Have the runner print skipped host-only checks clearly.

### Setup Scripts Should Not Be Implicitly Run By Aggregators

In this environment, some `setup-production.php` subprocess runs behaved badly inside the sandbox. The fix was to keep those checks available, but not part of the default safe handoff command.

Better pattern:

- Aggregate runners should default to non-destructive checks.
- Migration, route-smoke, production DB and host-only commands should require explicit flags.
- If a command touches setup, migrations, production config, uploads or external services, document where it is safe to run.

### Browser QA Can Be Blocked By Tooling

Automated browser tooling was blocked by local permission errors in this workspace. The project still needed QA evidence.

Better pattern:

- Try browser automation first for visual/interactive changes.
- If automation is blocked, record the blocker precisely.
- Fall back to route smoke, rendered DOM checks and a manual QA checklist.
- Do not claim visual QA is complete until a real browser pass has been done.

### Demo Content Can Masquerade As Completion

Seed content was useful for building and testing, but it was not launch-ready.

Better pattern:

- Track content source/provenance from the beginning.
- Mark researched/demo content as draft until the client approves it.
- Add content audit checks for placeholder emails, phone numbers, bank accounts, generic links and unapproved source statuses.

### Production Completion Needs Evidence, Not Confidence

Many features were implemented locally, but production completion still required host config, MySQL smoke, real credentials and client signoff.

Better pattern:

- Maintain a completion evidence matrix.
- For each Definition of Done item, name the command or artifact that proves it.
- Keep private signoff evidence outside Git.
- Do not mark the project complete because local checks are green if host/client/manual-QA evidence is missing.

## Starter Pack Improvements To Keep

- Add project checklist/worklog templates by default for long website builds.
- Add a task brief section for:
  - storage model
  - external blockers
  - launch evidence
  - handoff command
  - manual QA status
- Add guidance for XAMPP local serving:
  - prefer junction/symlink into `htdocs` when safe, instead of copying files
  - verify the URL with an HTTP request
  - avoid starting MySQL unless the current storage mode needs it
- Add explicit "demo-ready vs production-ready" language to PHP/SQL projects.
- Add a default pattern for `docs/completion-evidence-matrix.md` and `docs/codex-continuation-prompt.md` on large projects.
- Use the long-project templates in `templates/project-checklist.md`, `templates/project-worklog.md`, `templates/completion-evidence-matrix.md`, and `templates/codex-continuation-prompt.md` when a build will span many phases.

## Ideas To Review Later

- Create a reusable PHP project handoff runner template.
- Create a reusable launch readiness checker template.
- Create a content audit helper template for placeholder/demo content.
- Add a starter-pack installer option that can copy only selected docs/skills into a project.
- Add a script that verifies starter-pack files after install.
- Add a lightweight "new project questionnaire" for storage, hosting, admin, uploads, content source, SEO, analytics and launch criteria.
