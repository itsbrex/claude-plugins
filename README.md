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

#### From GitHub

Add the marketplace and install the plugin:

```bash
/plugin marketplace add itsbrex/claude-plugins
/plugin install ty-lsp@claude-plugins
```

#### Local Development

Clone the repository and add it as a local marketplace:

```bash
git clone https://github.com/itsbrex/claude-plugins.git
cd claude-plugins

# Add the local marketplace
/plugin marketplace add ./ty-lsp-plugin

# Install the plugin
/plugin install ty-lsp@claude-plugins
```

To update after making changes:

```bash
/plugin marketplace update claude-plugins
```

#### Quick Test (without marketplace)

```bash
claude --plugin-dir ./ty-lsp-plugin
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
├── ty-lsp-plugin/              # The plugin (and marketplace root)
│   ├── .claude-plugin/
│   │   ├── plugin.json         # Plugin manifest
│   │   └── marketplace.json    # Marketplace configuration
│   ├── .lsp.json               # LSP configuration
│   ├── README.md               # Plugin documentation
│   ├── verify-setup.sh         # Setup verification
│   └── test/
│       └── example.py          # Test file with type errors
├── CLAUDE.md                   # Claude Code instructions
└── README.md                   # This file
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
