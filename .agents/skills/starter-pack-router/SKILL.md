---
name: starter-pack-router
description: Route Codex work to the correct starter pack in a multi-pack workspace. Use when the user has multiple starter packs such as web development, Binance/trading bots, Unity/C# games, or future domain packs, and Codex must choose which skills/docs/MCP policies to load and improve.
---

# Starter Pack Router

Use this skill when multiple starter packs are available.

## Routing Principle

Choose the smallest starter pack that matches the project. Do not load every pack by default.

## Known Pack Types

- Web pack: HTML, CSS, JavaScript, PHP, SQL/MySQL, XAMPP, GitHub Pages, PHP hosting, browser QA.
- Trading/Binance pack: Binance API, demo/testnet, grid bots, backtesting, paper trading, strategy evidence, risk controls, API key safety.
- Game pack: Unity, C#, gameplay systems, scenes, prefabs, assets, builds, playtesting. This pack is planned, not yet installed.

## Selection Rules

1. Read the project root `AGENTS.md` first.
2. If a `starter-packs/` or `packs/` folder exists, inspect only pack index files before choosing.
3. Use the web pack for website/app tasks.
4. Use the trading pack for Binance, exchanges, strategies, bots, risk, backtesting or live/paper trading.
5. Use the game pack for Unity/C# game work once it exists.
6. If a project combines domains, use one primary pack and only the specific secondary skill/docs needed.

## Safety Rules

- Trading/live exchange actions require explicit user approval.
- Production database, broad filesystem, private workspace MCP and live deploys require approval.
- Do not copy secrets or private evidence between packs.
- Recursive improvements must be promoted only to the pack that owns the lesson, unless the lesson is cross-domain.

## Cross-Pack Improvements

- Put web-only lessons in the web pack.
- Put trading-only lessons in the trading pack.
- Put game-only lessons in the game pack.
- Put shared process lessons in the hub docs or a shared/core pack.

## Final Response

State which pack was selected, why, which docs/skills were read, and whether any improvement candidate should be promoted back to a pack.
