# Binance Trading Starter Pack Changelog

## 2026-06-28 - Initial Binance Trading Pack

### Added

- `AGENTS.md`
- `.agents/skills/binance-trading-workflow/SKILL.md`
- `.agents/skills/trading-mcp-safety-review/SKILL.md`
- `.agents/skills/strategy-backtest-review/SKILL.md`
- `docs/trading-tooling-research.md`
- `docs/mcp-install-policy.md`
- `.codex/config.example.toml`
- `templates/trading-task-brief.md`
- `templates/risk-plan.md`
- `README.md`
- `.gitignore`

### Why

The user wants a separate starter pack for Binance and crypto trading bot work. Research found useful official docs, mature bot frameworks, CCXT, and several community MCP candidates, but trade-capable MCPs are too sensitive for automatic install.

### Decisions

- Official Binance docs/connectors are the default source for Binance-specific behavior.
- CCXT is recommended for multi-exchange abstraction after capability checks.
- Freqtrade and Hummingbot are references for mature bot workflows.
- Community Binance/CCXT MCP servers are documented as optional candidates only.
- No trade-capable MCP is enabled by default.
- Live orders, leverage changes, transfers, and withdrawals require explicit approval.
