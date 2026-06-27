---
name: strategy-backtest-review
description: Review crypto trading strategies, grid bots, backtests, paper trading results, risk controls, and launch readiness. Use before changing strategy logic, trusting a profitable backtest, enabling paper/testnet execution, or moving a bot toward live trading.
---

# Strategy Backtest Review

Use this skill to decide whether strategy evidence is strong enough for the next stage.

## Evidence Checklist

1. Define the market, pair, timeframe, data source, fees, slippage, and date range.
2. Separate in-sample tuning from out-of-sample validation.
3. Check drawdown, max consecutive losses, exposure, position size, win rate, profit factor, and fee sensitivity.
4. Confirm the strategy respects exchange filters, liquidity, min notional, tick size, step size, and partial fills.
5. Verify that stop conditions exist: max daily loss, max open exposure, kill switch, API failure handling, and stale data handling.
6. Compare backtest with paper/testnet behavior before live trading.

## Red Flags

- Profit only appears after heavy parameter tuning.
- Fees, slippage, funding, spread, or rejected orders are ignored.
- Strategy assumes fills at candle highs/lows without realistic execution logic.
- Live mode shares the same path as test mode without a manual approval gate.
- The bot can increase leverage or position size after losses without hard limits.

## Launch Gates

- Backtest-ready: reproducible run with assumptions documented.
- Paper-ready: risk limits and dry-run order simulation verified.
- Testnet-ready: exchange API integration verified without real funds.
- Live-ready: explicit user approval, scoped API key, small position size, monitoring, and rollback plan.

## Final Response

State current readiness level, evidence reviewed, blockers, and the safest next step.
