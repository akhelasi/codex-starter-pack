# Starter Pack Contract

Use this contract when adding or reviewing focused packs such as web, Binance/trading, Unity/game, data, or future domain packs.

## Required Shape

Each focused pack should include:

- `AGENTS.md` with the pack purpose, safety defaults, and routing rules.
- `.agents/skills/<skill-name>/SKILL.md` for repeatable workflows.
- `docs/<domain>-tooling-research.md` or equivalent research note.
- `docs/starter-pack-changelog.md` for pack-local changes.
- `templates/` for reusable briefs, checklists, or risk plans.
- Optional `.codex/config.example.toml` with disabled MCP examples only.
- Optional `.gitignore` for domain-specific private/generated data.

## Safety Defaults

- Do not enable account, production, broad filesystem, trading, payment, cloud, or database tools by default.
- Use read-only or paper/test modes first when the domain supports them.
- Put secrets in environment variables or local private config, never templates.
- Add explicit approval gates for destructive, costly, public, or live actions.

## Routing Rules

- The root `starter-pack-router` skill decides which pack applies.
- Packs should not load all docs by default.
- Pack docs should say when the pack is not appropriate.
- Cross-pack lessons should be promoted to the root starter pack only when reusable beyond one domain.

## Verification

Every pack should document:

- Minimal local checks.
- Full verification checks.
- External blockers.
- What counts as demo-ready, handoff-ready, and production/live-ready.

## Changelog

Update the pack-local changelog after meaningful changes, and update the root changelog when the root pack map, router, installer, or shared policy changes.
