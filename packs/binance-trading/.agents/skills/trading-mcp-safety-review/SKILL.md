---
name: trading-mcp-safety-review
description: Evaluate Binance, CCXT, crypto exchange, market-data, account, or trading MCP servers before installation or use. Use when Codex is asked to install, configure, recommend, audit, or enable an MCP that can read exchange data, access balances, place/cancel orders, transfer funds, withdraw funds, or manage leverage.
---

# Trading MCP Safety Review

Use this before enabling any crypto trading MCP.

## Default Decision

Do not install or enable trade-capable MCPs by default. Document candidates first, then require explicit user approval before enabling anything with account, order, transfer, withdrawal, futures, leverage, or private-history access.

## Review Checklist

1. Prefer official exchange docs and official SDKs over unofficial trade-capable MCPs.
2. Check repo activity, license, stars/forks, recent commits, issues, package registry metadata, and whether the project is archived.
3. Read the README for tool capabilities, especially order placement, cancellation, transfers, withdrawals, leverage, and account access.
4. Look for security guidance: testnet mode, read-only mode, environment variables, bearer tokens, local-only binding, and key scoping.
5. Reject or quarantine tools that require secrets in plain config, encourage broad permissions, expose HTTP without auth, or default to live trading.
6. If installed later, start read-only or testnet-only.

## Risk Tiers

- Tier 0: documentation only. Safe default.
- Tier 1: public market data only. Usually acceptable after source review.
- Tier 2: private read-only account data. Requires user approval and read-only API keys.
- Tier 3: order placement/cancel, leverage, futures, transfers. Requires explicit approval, testnet/paper first, and strict config.
- Tier 4: withdrawal support or broad account administration. Do not enable for Codex workflows unless the user explicitly accepts the risk.

## Final Response

State candidate, risk tier, install decision, sources checked, and exact permissions that would be required.
