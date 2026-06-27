# Binance Trading Starter Pack

Codex starter pack for Binance and crypto trading bot development.

Use this pack when a project involves:

- Binance API
- crypto exchange connectors
- grid bots
- backtesting
- paper trading or testnet
- live trading safety review
- risk controls
- API key handling
- trading MCP review

## How To Start A Project

Copy this pack into the project root or tell Codex:

```text
Use the Binance trading starter pack. Read AGENTS.md first. Use only the skills/docs needed for this task. Do not enable trade-capable MCPs or use real exchange keys without my explicit approval.
```

## Important Default

No trade-capable MCP is enabled by default. This pack documents candidates and provides optional config examples, but live exchange access must be reviewed and approved per project.

## Main Files

- `AGENTS.md` - core trading pack rules.
- `.agents/skills/binance-trading-workflow/SKILL.md` - trading bot development workflow.
- `.agents/skills/trading-mcp-safety-review/SKILL.md` - MCP review and install gate.
- `.agents/skills/strategy-backtest-review/SKILL.md` - strategy/backtest/paper/live readiness review.
- `docs/trading-tooling-research.md` - researched tools and recommendations.
- `docs/mcp-install-policy.md` - safe MCP enablement policy.
- `.codex/config.example.toml` - commented optional MCP examples.
- `templates/` - task and risk templates.
