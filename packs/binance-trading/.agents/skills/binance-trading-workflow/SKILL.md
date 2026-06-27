---
name: binance-trading-workflow
description: Build, modify, debug, or review Binance and crypto trading bot projects. Use for Binance API work, exchange connectors, grid bots, market data, order sizing, testnet, paper trading, backtesting, strategy changes, risk controls, API key handling, and trading automation.
---

# Binance Trading Workflow

Use this skill for crypto trading software. Do not treat it as investment advice.

## Workflow

1. Read the project `AGENTS.md`, task brief, current bot architecture, config model, and storage model.
2. Identify mode: research, backtest, paper/testnet, or live trading.
3. Keep market data, signal generation, order sizing, execution, logging, and risk controls separated.
4. Prefer official Binance docs/connectors for Binance-specific behavior.
5. Use CCXT only when multi-exchange abstraction is useful and the exact exchange capability is verified.
6. Add or update tests for sizing, exchange filters, rounding, fees, stop conditions, and failure handling.
7. Record evidence before promoting a strategy from backtest to paper/testnet, or from paper/testnet to live.

## Hard Safety Gates

- Never place live orders without explicit user approval for that exact action.
- Never enable withdrawals on bot API keys.
- Never commit API keys, account exports, `.env`, real trade logs, or private balances.
- Do not change leverage, margin mode, or position size rules without calling out the risk.
- If API access is missing, mark it as `WAITING`.

## Binance API Checklist

- Check symbol filters before order placement: lot size, min notional, tick size, step size.
- Handle rate limits, timestamp drift, recvWindow, network retries, and exchange maintenance.
- Validate order side, order type, market type, and account type before submitting.
- Log every intended order and every exchange response.
- Support dry-run/testnet mode before live mode.

## Final Response

Report changed files, checks run, trading mode, remaining risks, and whether any live-action approval is still required.
