# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

Claude Code plugin integrating **ty** (Astral's extremely fast Python type checker and LSP written in Rust) with Claude Code.

**Important**: Always use "ty" (lowercase), not "Ty" or "TY".

**Attribution**: Plugin by Brian Roach. ty by [Astral](https://astral.sh).

## Architecture

Monorepo with `/ty-lsp-plugin/` as the distributable plugin directory.

**Critical plugin structure rule**: Plugin manifest files (`plugin.json` and `marketplace.json`) go inside `.claude-plugin/`. The `.lsp.json` and other files must be at the plugin root level.

```
ty-lsp-plugin/
├── .claude-plugin/
│   ├── plugin.json              # Plugin manifest
│   └── marketplace.json         # Local marketplace config
├── .lsp.json                    # LSP config (at plugin root)
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

## Marketplace Configuration

The `marketplace.json` (in `.claude-plugin/`) enables local plugin installation. It references plugins by their location:

```json
{
  "name": "cc-plugins",
  "owner": {
    "name": "itsbrex"
  },
  "plugins": [
    {
      "name": "ty-lsp",
      "source": "./",
      "description": "ty LSP server plugin for Python type checking. ty is an extremely fast Python type checker written in Rust by Astral."
    }
  ]
}
```

**Key fields**:
- `name`: Marketplace identifier (used in install command: `/plugin install ty-lsp@cc-plugins`)
- `owner`: Object with `name` field (required) and optional `email`
- `plugins[].source`: Relative path string for local plugins (must start with `./`, e.g., `"./"` for current directory)
- `plugins[].description`: Plugin description for discoverability

To use this plugin locally, add to `~/.claude/settings.json`:

```json
{
  "enabledPlugins": {
    "ty-lsp@cc-plugins": true
  },
  "extraKnownMarketplaces": {
    "itsbrex": {
      "source": {
        "source": "directory",
        "path": "/path/to/ty-claude-plugin/ty-lsp-plugin"
      }
    }
  }
}
```

## LSP Configuration

The `.lsp.json` configures how Claude Code launches ty:

```json
{
  "python": {
    "command": "uvx",
    "args": ["ty@latest", "server"],
    "extensionToLanguage": {
      ".py": "python",
      ".pyi": "python"
    },
    "loggingConfig": {
      "args": ["--verbose"],
      "env": {
        "TY_LOG_FILE": "${CLAUDE_PLUGIN_LSP_LOG_FILE}"
      }
    }
  }
}
```

**Key points**:
- The server command is `server`, NOT `servern` (common typo)
- `uvx` auto-installs ty; `ty@latest` ensures newest version
- `loggingConfig`: Enables verbose logging when user runs with `--enable-lsp-logging`
- `${CLAUDE_PLUGIN_LSP_LOG_FILE}` expands to `~/.claude/debug/` log path

## Testing

`test/example.py` has intentional type errors:
- Line 12: String `"5"` passed to `int` parameter
- Line 15: Int `42` passed to `str` parameter

Always run `verify-setup.sh` after modifying LSP configuration.

## Editing Guidelines

- **plugin.json**: Keep attribution clear (ty by Astral, plugin by Brian Roach)
- **Version**: Follows semver in `plugin.json` (current: 1.0.0)
- **Adding tests**: Add Python files to `ty-lsp-plugin/test/` with type annotations and intentional errors
