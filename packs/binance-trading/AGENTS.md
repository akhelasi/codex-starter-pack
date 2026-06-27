# Codex Binance / Crypto Trading Guide

Use this pack for Binance, crypto trading bots, grid strategies, backtests, paper trading, testnet work, and exchange API research.

## Pack Purpose

This is a Codex starter pack for trading-related software work. It is not a trading strategy, financial advice, or a guarantee of profit. It gives Codex safety rules, research notes, reusable skills, and templates for building and reviewing trading tools.

## Pack Map

- `AGENTS.md`: primary instructions for this trading pack.
- `.agents/skills/binance-trading-workflow/SKILL.md`: build or modify Binance/crypto trading bot code.
- `.agents/skills/trading-mcp-safety-review/SKILL.md`: evaluate MCP servers before enabling exchange or account access.
- `.agents/skills/strategy-backtest-review/SKILL.md`: review strategy evidence, backtests, paper trading, and launch readiness.
- `.codex/config.example.toml`: optional MCP examples; do not copy blindly into active config.
- `docs/trading-tooling-research.md`: researched tools, docs, MCP candidates, and safety notes.
- `docs/mcp-install-policy.md`: rules for enabling read-only, testnet, paper, or live trading tools.
- `templates/trading-task-brief.md`: project/task intake template.
- `templates/risk-plan.md`: reusable risk and launch gate template.

## Default Safety Rules

- Do not provide financial advice or claim a strategy is profitable.
- Do not place live orders, cancel live orders, transfer funds, withdraw funds, or change leverage without explicit user approval for that exact action.
- Prefer official Binance docs/connectors for Binance-specific API work.
- Prefer testnet, dry-run, paper trading, or backtesting before any real account action.
- Keep API keys out of Git. Never commit `.env`, config files with keys, account exports, screenshots of secrets, or private trade history.
- Use read-only API keys unless the task explicitly requires order placement.
- Disable withdrawal permissions on trading keys.
- Prefer IP restrictions for exchange API keys when available.
- Treat futures, leverage, margin mode, and position sizing as high risk.
- For MCP servers with order/account tools, default to disabled documentation-only status until reviewed and approved.

## Tooling Defaults

Use these by default:

- Binance official API docs for endpoint behavior, authentication, testnet, rate limits, filters, and error codes.
- Binance official connectors when a direct Binance client is needed.
- CCXT for multi-exchange market data or exchange abstraction after checking the exact exchange capability.
- Freqtrade or Hummingbot docs as reference for mature bot workflow patterns, not as automatic dependencies.

Do not enable by default:

- Trade-capable MCP servers.
- MCP servers that can withdraw, transfer, place orders, change leverage, or read full account history.
- Broad filesystem, browser profile, password-manager, or production database MCPs.

## Verification

For trading software, verification should include the smallest relevant checks:

- Unit tests for sizing, fees, filters, order rounding, and risk limits.
- Backtest with documented assumptions and time window.
- Paper/testnet run before live trading.
- Explicit evidence for max drawdown, loss streak, fee/slippage assumptions, and failure modes.
- Manual approval gate before live order execution.

If real exchange access is unavailable, record the missing access as `WAITING`, not as a code bug.
