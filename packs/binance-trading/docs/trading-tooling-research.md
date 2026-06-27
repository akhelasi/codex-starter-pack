# Binance / Crypto Trading Tooling Research

Research date: 2026-06-28

This document records tools, MCP candidates, and documentation useful for Binance or crypto trading work with Codex. It is intentionally conservative: trading tools can move real money, so default recommendations prefer official docs, read-only data, testnet, backtesting, and paper trading.

## Recommended Baseline

Use by default:

- Binance official API documentation: endpoint behavior, request signing, exchange filters, rate limits, errors, WebSocket streams, and testnet references.
- Binance official connectors: preferred when writing Binance-specific client code.
- CCXT: useful for multi-exchange abstraction and market data, but always verify exact exchange support and market type.
- Freqtrade docs: useful reference for backtesting, dry-run/paper style workflows, and strategy review patterns.
- Hummingbot docs: useful reference for connector-based bot architecture and market-making style workflows.

Do not enable by default:

- Unofficial MCP servers that can place/cancel orders, transfer funds, change leverage, or access full private account data.
- MCP servers that require real exchange secrets in client config before a clear need exists.
- Remote MCP endpoints for exchange accounts unless authentication, network binding, and token handling are reviewed.

## Source Review Summary

| Tool / source | Type | Current signal | Starter-pack decision |
| --- | --- | --- | --- |
| Binance API docs | Official docs | Primary source for REST/WebSocket/auth/filter behavior | Recommended baseline |
| `binance/binance-connector-python` | Official GitHub SDK | MIT, active, Binance-owned, 2.8k+ stars checked | Recommended for Binance Python clients |
| `binance/binance-connector-js` | Official GitHub SDK | MIT, active, Binance-owned, 700+ stars checked | Recommended for Binance JS clients |
| `ccxt/ccxt` | Mature multi-exchange library | MIT, active, 43k+ stars checked | Recommended when multi-exchange abstraction helps |
| `freqtrade/freqtrade` | Mature trading bot framework | GPL-3.0, active, 51k+ stars checked | Use as reference or dependency only when project scope fits |
| `hummingbot/hummingbot` | Mature trading bot framework | Apache-2.0, active, 19k+ stars checked | Use as reference or dependency only when project scope fits |
| `doggybee/mcp-server-ccxt` | Community CCXT MCP | MIT, active, 139 stars checked; README exposes private/order tools | Document only; enable only after approval |
| `lazy-dinosaur/ccxt-mcp` | Community CCXT MCP | MIT, active, 90 stars checked; README includes trading and risk prompts | Document only; enable only after approval |
| `AnalyticAce/binance-mcp-server` | Community Binance MCP | MIT, active, 48 stars checked; README includes account/trading/withdrawal-related tools | Document only; high caution |

## MCP Findings

There are community MCP servers for Binance and CCXT, but none should be treated as safe default tooling for Codex. The strongest candidates by public activity during this review were:

- `doggybee/mcp-server-ccxt`
- `lazy-dinosaur/ccxt-mcp`
- `AnalyticAce/binance-mcp-server`

The issue is capability risk, not only popularity. These tools can expose private account data and trading actions. Some README examples mention order placement, cancellation, futures/leverage, transfers, or withdrawal-related history. That makes them unsuitable for automatic installation in a general starter pack.

## Safe MCP Recommendation

Default state:

- Keep trade-capable MCPs out of active Codex config.
- Store candidate notes and commented examples only.
- If a project needs MCP market data, prefer a public-market-data-only mode or read-only API key.
- If private account access is needed, require explicit approval and read-only keys.
- If order placement is needed, require testnet/paper mode first and a live-action approval gate.

## Security Checklist For Any Candidate

- Is the source repository public and active?
- Is the license clear?
- Are install steps from npm/PyPI/GitHub consistent with the source repo?
- Does it expose order, cancel, transfer, withdrawal, leverage, or futures tools?
- Can it run in read-only or testnet mode?
- Does it store secrets only in environment variables or ignored local files?
- Does it bind to localhost only by default if it uses HTTP/SSE?
- Does it require a bearer token or other auth for HTTP/SSE mode?
- Are API keys scoped and withdrawal disabled?
- Can Codex work without the MCP by using official docs and local code tests?

## Sources

- Binance Spot API docs: https://developers.binance.com/docs/binance-spot-api-docs
- Binance connector Python: https://github.com/binance/binance-connector-python
- Binance connector JS: https://github.com/binance/binance-connector-js
- CCXT: https://github.com/ccxt/ccxt
- Freqtrade: https://github.com/freqtrade/freqtrade and https://www.freqtrade.io/
- Hummingbot: https://github.com/hummingbot/hummingbot and https://hummingbot.org/
- CCXT MCP candidate: https://github.com/doggybee/mcp-server-ccxt
- CCXT MCP candidate: https://github.com/lazy-dinosaur/ccxt-mcp
- Binance MCP candidate: https://github.com/AnalyticAce/binance-mcp-server

## Notes From This Review

- GitHub metadata and README files were checked for the main MCP candidates.
- npm registry metadata checks timed out in this environment, so package install commands were not trusted as verified install steps.
- No external MCP package was executed or globally installed during this review.
