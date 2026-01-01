# ty LSP Plugin for Claude Code

A Claude Code plugin that integrates [ty](https://docs.astral.sh/ty), an extremely fast Python type checker and language server written in Rust.

## About

**Plugin author**: Brian Roach

**ty type checker**: Created by [Astral](https://astral.sh), the creators of uv and Ruff

## What is ty?

ty is an extremely fast Python type checker and language server, written in Rust. It provides:

- Lightning-fast type checking
- Real-time code intelligence
- Support for modern Python type hints
- Integration with LSP-compatible editors

## Features

This plugin enables Claude Code to use ty for:

- Real-time Python type checking
- Code intelligence for `.py` and `.pyi` files
- Hover information with type details
- Go-to-definition and find-references
- Type-aware code completion

## Installation

### Prerequisites

- Claude Code version 1.0.33 or later
- `uv` installed (which includes `uvx`)

Install uv if you don't have it:
```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### Install the Plugin

#### Local testing
```bash
claude --plugin-dir ./ty-lsp-plugin
```

#### From a marketplace
```bash
/plugin install ty-lsp
```

## Quick Start

1. Install the plugin using one of the methods above
2. Start working with Python files in Claude Code
3. ty will automatically provide type checking and code intelligence

No manual configuration needed - ty is automatically installed via `uvx` on first use.

## Verification

Run the included verification script to check prerequisites:

```bash
./ty-lsp-plugin/verify-setup.sh
```

## Documentation

- [ty Documentation](https://docs.astral.sh/ty)
- [ty Editor Settings](https://docs.astral.sh/ty/reference/editor-settings/)
- [Claude Code Plugin Documentation](https://code.claude.com/docs/en/plugins-reference)

## Repository Structure

```
ty-claude-plugin/
├── ty-lsp-plugin/          # The actual plugin
│   ├── .claude-plugin/
│   │   └── plugin.json     # Plugin manifest
│   ├── .lsp.json           # LSP configuration
│   ├── README.md           # Plugin documentation
│   ├── TEST_RESULTS.md     # Test results
│   ├── verify-setup.sh     # Setup verification
│   └── test/
│       └── example.py      # Test file
├── TESTING_SUMMARY.md      # Overall testing summary
└── README.md               # This file
```

## Testing

See [TESTING_SUMMARY.md](TESTING_SUMMARY.md) for detailed test results and verification steps.

## Contributing

Issues and pull requests are welcome! Please make sure to:

1. Test changes with `./ty-lsp-plugin/verify-setup.sh`
2. Update documentation as needed
3. Follow existing code style

## License

MIT

## Links

- [ty by Astral](https://docs.astral.sh/ty)
- [Astral](https://astral.sh)
- [Claude Code](https://code.claude.com)
