# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Claude Code plugin integrating **ty** (Astral's extremely fast Python type checker and LSP written in Rust) with Claude Code.

**Important**: Always use "ty" (lowercase), not "Ty" or "TY".

**Attribution**: Plugin by Brian Roach. ty by [Astral](https://astral.sh).

## Architecture

Monorepo with `/ty-lsp-plugin/` as the distributable plugin directory.

**Critical plugin structure rule**: Only `plugin.json` goes inside `.claude-plugin/`. The `.lsp.json` and all other files must be at the plugin root level.

```
ty-lsp-plugin/
├── .claude-plugin/plugin.json   # Plugin manifest (ONLY file in this dir)
├── .lsp.json                    # LSP config (at plugin root, NOT inside .claude-plugin/)
├── verify-setup.sh              # Prerequisite verification
└── test/example.py              # Test file with intentional type errors
```

## Development Commands

```bash
# Verify prerequisites (uvx, ty, plugin structure)
./ty-lsp-plugin/verify-setup.sh

# Test plugin locally
claude --plugin-dir ./ty-lsp-plugin

# Test ty type checking directly
uvx ty@latest check ty-lsp-plugin/test/example.py
```

## LSP Configuration

The `.lsp.json` configures how Claude Code launches ty:

```json
{
  "python": {
    "command": "uvx",
    "args": ["ty@latest", "server"],
    "extensionToLanguage": { ".py": "python", ".pyi": "python" }
  }
}
```

**Key points**:
- The server command is `server`, NOT `servern` (common typo)
- `uvx` auto-installs ty; `ty@latest` ensures newest version

## Testing

`test/example.py` has intentional type errors:
- Line 12: String `"5"` passed to `int` parameter
- Line 15: Int `42` passed to `str` parameter

Always run `verify-setup.sh` after modifying LSP configuration.

## Editing Guidelines

- **plugin.json**: Keep attribution clear (ty by Astral, plugin by Brian Roach)
- **Version**: Follows semver in `plugin.json` (current: 1.0.0)
- **Adding tests**: Add Python files to `ty-lsp-plugin/test/` with type annotations and intentional errors
