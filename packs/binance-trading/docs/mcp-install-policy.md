# Trading MCP Install Policy

Use this policy before installing or enabling Binance, CCXT, or other exchange MCP servers.

## Default

Do not install trade-capable MCPs automatically. Add documentation and config examples first. Enable an MCP only when a project needs it and the user approves the exact access level.

## Access Levels

1. Documentation only: allowed by default.
2. Public market data: allowed after source review.
3. Private read-only account data: requires user approval and read-only API keys.
4. Testnet or paper order placement: requires user approval, scoped testnet keys, and logs.
5. Live order placement: requires explicit approval for that exact workflow, small size, risk limits, and rollback plan.
6. Withdrawal or broad account admin: blocked by default.

## Install Gate

Before enabling any trading MCP, Codex must record:

- Why the MCP is needed.
- Repository/package source.
- Capabilities exposed.
- Whether it can run read-only or testnet-only.
- Required API key permissions.
- Whether withdrawal is disabled.
- Whether keys can be IP restricted.
- Where secrets will live and how they stay out of Git.
- Exact command/config to be used.
- Verification step after install.

## Safe Defaults

- Prefer localhost-only MCP servers.
- Prefer stdio over remote HTTP when possible.
- If HTTP/SSE is used, require bearer token auth and local binding.
- Use `.env.local`, ignored config files, or OS secret storage for credentials.
- Do not place API secrets directly in Codex global config unless the user explicitly accepts that tradeoff.

## Approval Text To Ask The User

Use a clear prompt like:

```text
This MCP can access private exchange data and may be able to place or cancel orders.
I can configure it in read-only/testnet mode only. Please confirm:
1. Which exchange account should be used?
2. Is this read-only, testnet/paper, or live?
3. Do you approve the exact config/command shown above?
```

## Verification After Enabling

- Confirm MCP starts.
- Confirm no real keys were committed.
- Confirm market/account mode is read-only, testnet, or live as approved.
- Run a harmless public market-data query first.
- For private access, run a balance/account query only after approval.
- For order tools, do not place an order until a separate exact-action approval is given.
