# Codebase Memory MCP Research

Verified: 2026-07-07.

Repository: https://github.com/DeusData/codebase-memory-mcp

## What It Is

`codebase-memory-mcp` is a code-intelligence MCP server. It indexes a repository into a local persistent knowledge graph so AI coding agents can ask structural questions about a codebase instead of repeatedly reading files one by one.

It is different from a general "memory" note system. Its memory is mostly code-derived: files, symbols, functions, classes, calls, imports, routes, architecture summaries, cross-service links, and architecture decision records stored through its MCP tools.

## What It Claims To Do

The repository README describes:

- A single static binary for Windows, macOS, and Linux.
- Local indexing of codebases using tree-sitter parsing across many languages.
- Hybrid LSP semantic resolution for languages including JavaScript, TypeScript, PHP, C#, Go, C/C++, Java, Kotlin, Python, and Rust.
- A persistent graph of functions, classes, call chains, routes, imports, and cross-service relationships.
- MCP tools for indexing, graph search, architecture summaries, change-impact detection, code snippets, code search, ADR management, and trace ingestion.
- Optional local graph UI at `http://localhost:9749`.
- Automatic agent configuration for several coding agents, including Codex CLI.

Useful MCP tool names documented by the project include:

- `index_repository`
- `list_projects`
- `index_status`
- `search_graph`
- `search_code`
- `query_graph`
- `trace_path`
- `detect_changes`
- `get_code_snippet`
- `get_architecture`
- `manage_adr`
- `ingest_traces`

## Why It Can Help Codex

Use it when Codex is working in a large, unfamiliar, multi-language, or long-lived codebase and needs to answer questions like:

- Where is this function called?
- Which files/routes/classes are affected by this change?
- What are the likely entry points and architecture boundaries?
- Are there dead functions or isolated modules?
- Which backend route is connected to this frontend call?
- What changed in this diff and what code paths are at risk?

For small static sites or one-file tasks, normal `rg`, file reads, and project docs are usually simpler.

## Security And Trust Notes

Do not install this MCP by default.

The upstream SECURITY.md is transparent about the access model: the tool reads source files across the codebase, writes agent configuration files, and can spawn background processes. The project says indexing and MCP queries run locally and do not upload source code, paths, indexes, query contents, environment variables, usage metrics, or telemetry. It also says the server performs a best-effort GitHub release update check after MCP initialization.

Positive signals found during review:

- MIT license.
- Active public GitHub repository.
- Public security policy.
- Published latest release at review time: `v0.8.1`.
- Release process claims SHA-256 checksums, SLSA provenance, Sigstore signatures, SBOM, VirusTotal scanning, OpenSSF Scorecard, and CI security checks.
- Windows installer enforces HTTPS download URLs, downloads release checksums, and verifies SHA-256 when the checksum line is available.

Risk signals and caution:

- It has broad read access to the active codebase by design.
- The default installer can modify agent configuration files.
- The installer adds a binary directory to the user PATH.
- It can run a background watcher when configured.
- It is third-party software, so a public repo and popularity are not proof that every future release is safe.

## Starter Pack Policy

Treat Codebase Memory MCP as an optional code-intelligence tool, not a required dependency.

Before installing or enabling it:

1. Confirm the active project is large enough to benefit from a code graph.
2. Ask the user for approval because it reads code and edits agent configuration.
3. Review the upstream README, SECURITY.md, latest release, and install script for the current version.
4. Prefer `--skip-config` first if the goal is to install only the binary and manually add MCP config later.
5. Keep auto-indexing and background watching explicit. Do not enable broad automatic indexing for many projects without user approval.
6. Do not point it at folders containing secrets, database dumps, client-private evidence, or unrelated personal files.
7. Add a project `.cbmignore` when needed, in addition to `.gitignore`.

## Windows Install Shape

Do not run this automatically from the starter pack.

Recommended starter-pack wrapper flow:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-optional-memory-tools.ps1 -InstallCodebaseMemory
```

This installs Codebase Memory MCP in binary-only mode by default through upstream `--skip-config`. It does not configure Codex automatically.

Configure agent integration only after explicit approval:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\install-optional-memory-tools.ps1 -InstallCodebaseMemory -ConfigureCodebaseMemory
```

Manual review-first flow:

```powershell
Invoke-WebRequest -Uri https://raw.githubusercontent.com/DeusData/codebase-memory-mcp/main/install.ps1 -OutFile install-codebase-memory-mcp.ps1
notepad .\install-codebase-memory-mcp.ps1
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\install-codebase-memory-mcp.ps1 --skip-config
```

After binary-only install, configure Codex MCP manually and keep it disabled until needed.

## Why The Binary Is Not Vendored

Do not commit the third-party executable or downloaded installer into this starter pack.

Reasons:

- It would turn the starter pack into a binary supply-chain mirror.
- The binary would become stale while upstream security fixes continue.
- Users would lose the ability to verify the current release source, checksums and security notes.
- GitHub repositories become heavier and harder to audit when executable assets are mixed with docs/templates.

Instead, keep the wrapper script, source links, policy and review steps in the starter pack.

## Obsidian Comparison

Codebase Memory MCP and Obsidian overlap only in the broad word "memory".

Codebase Memory MCP is better for machine-generated code intelligence: symbols, call graphs, route maps, architecture summaries, cross-file relationships, impact analysis, and code search.

Obsidian is better for human/project memory: requirements, user decisions, why a decision was made, daily logs, blockers, screenshots/evidence references, research notes, client context, and handoff notes.

Recommendation: keep the Obsidian-compatible Markdown workflow. Add Codebase Memory MCP as an optional upgrade for large codebases. They complement each other:

- Obsidian answers "what did we decide and why?"
- Codebase Memory MCP answers "how is the code connected?"

## Source Links

- Codebase Memory MCP: https://github.com/DeusData/codebase-memory-mcp
- Security policy: https://github.com/DeusData/codebase-memory-mcp/blob/main/SECURITY.md
- Latest releases: https://github.com/DeusData/codebase-memory-mcp/releases
- MCP server metadata: https://github.com/DeusData/codebase-memory-mcp/blob/main/server.json
- Obsidian internal links: https://obsidian.md/help/links
