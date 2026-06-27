# Multi Starter Pack Hub

Updated: 2026-06-28

This document defines how to use multiple Codex starter packs together.

## Goal

The user wants several focused starter packs in one workspace:

- Web development starter pack: current pack, for HTML, CSS, JavaScript, PHP, SQL/MySQL, XAMPP, GitHub and browser QA.
- Binance/trading starter pack: initial pack installed under `packs/binance-trading/`, for Binance bots, crypto exchange APIs, demo/testnet, strategy research, backtesting and risk controls.
- Unity/C# game starter pack: planned future pack for Unity, C#, gameplay, assets, builds and playtesting.

Codex should select the relevant starter pack for the active project instead of loading everything.

## Suggested Folder Shape

Use a parent folder such as:

```text
codex-starter-packs/
  README.md
  AGENTS.md
  packs/
    web/
    binance-trading/
    unity-game/
  shared/
    docs/
    templates/
```

This repository still keeps the web pack at the root for compatibility, and now also contains the initial Binance/trading pack under `packs/binance-trading/`.

## Routing Workflow

1. Identify the project domain from the user's request and project files.
2. Choose one primary pack.
3. Read only the primary pack's `AGENTS.md`, skill metadata and relevant docs.
4. Pull a secondary pack only for a specific cross-domain need.
5. Keep recursive improvements inside the owning pack unless the lesson is cross-domain.

## Pack Ownership

| Work type | Primary pack |
| --- | --- |
| HTML/CSS/JS/PHP/SQL website | web |
| GitHub Pages static site | web |
| PHP hosting/XAMPP/MySQL | web |
| Binance API bot | binance-trading |
| Grid strategy/backtest/risk | binance-trading |
| Unity/C# game | unity-game |
| Shared prompt/process/tool stability | shared/core or current pack until hub exists |

## Recursive Improvement Rule

When a project produces a reusable lesson:

- Web-specific lessons improve the web pack.
- Trading-specific lessons improve the Binance/trading pack.
- Game-specific lessons improve the Unity/game pack.
- Generic process lessons improve shared docs or the router.

Do not promote project-private details, credentials, real balances, private client data, database dumps, screenshots or signoff evidence.

## Trading Pack Safety Preview

The Binance/trading pack should default to:

- read-only, simulation, paper trading or testnet mode
- no live orders without explicit approval
- no API keys in chat or Git
- environment variables/local ignored secrets for credentials
- backtest and risk evidence before strategy changes
- incident notes and rollback plans for live systems

## Future Work

- Continue improving `packs/binance-trading/` from real Binance bot work and keep trade-capable MCPs opt-in only.
- Later create a Unity/C# game pack with its own skills/docs/templates.
- Consider reorganizing this GitHub repo into a true `codex-starter-packs` hub once at least two packs are ready.
