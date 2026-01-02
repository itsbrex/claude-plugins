# Changelog

All notable changes to the ty LSP plugin will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-01-02

### Added
- Initial release of ty LSP plugin for Claude Code
- LSP server configuration for ty (Astral's Python type checker)
- Debug logging support with `--enable-lsp-logging` flag
- Test file with intentional type errors for verification
- Setup verification script (`verify-setup.sh`)
- Local marketplace configuration

### Technical Details
- Uses `uvx ty@latest server` for automatic ty installation
- Supports `.py` and `.pyi` file extensions
- Verbose logging to `~/.claude/debug/` when enabled
- Plugin metadata: MIT license, authored by Brian Roach
- ty project by [Astral](https://astral.sh)

[1.0.0]: https://github.com/itsbrex/ty-claude-plugin/releases/tag/v1.0.0
