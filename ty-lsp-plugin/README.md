# ty LSP Plugin for Claude Code

This plugin integrates [ty](https://docs.astral.sh/ty), an extremely fast Python type checker and language server written in Rust by Astral, with Claude Code to provide real-time type checking and code intelligence.

## Features

- Real-time Python type checking
- Code intelligence for `.py` and `.pyi` files
- Fast, incremental type checking powered by ty
- Automatic installation via `uvx` (no manual setup required)

## Prerequisites

- Claude Code version 1.0.33 or later
- `uvx` installed (comes with `uv`)

## Installation

### From GitHub

Add the marketplace and install the plugin:

```bash
/plugin marketplace add itsbrex/claude-plugins
/plugin install ty-lsp@cc-plugins
```

### Local Development

Clone the repository and add it as a local marketplace:

```bash
git clone https://github.com/itsbrex/claude-plugins.git
cd claude-plugins

# Add the local marketplace (from repo root)
/plugin marketplace add ./

# Install the plugin
/plugin install ty-lsp@cc-plugins

# Update after changes
/plugin marketplace update cc-plugins
```

### Quick Test (without marketplace)

```bash
claude --plugin-dir ./ty-lsp-plugin
```

## Usage

Once installed, the plugin automatically provides type checking and code intelligence for Python files. Claude Code will:

- Show type errors as you work with Python code
- Provide hover information for functions, classes, and variables
- Enable go-to-definition and find-references functionality
- Offer code completions based on type information

The ty LSP server runs automatically when you work with `.py` or `.pyi` files.

## Configuration

The plugin uses `uvx ty@latest server` to run the ty LSP server, which means:

- ty is automatically installed on first use
- You'll always get the latest version of ty
- No manual installation or configuration required

For additional ty configuration options, see the [ty editor settings documentation](https://docs.astral.sh/ty/reference/editor-settings/).

## Troubleshooting

### Plugin not loading

Ensure you're running Claude Code version 1.0.33 or later:

```bash
claude --version
```

### LSP server not starting

Verify that `uvx` is installed and in your PATH:

```bash
uvx --version
```

If not installed, install `uv` which includes `uvx`:

```bash
curl -LsSf https://astral.sh/uv/install.sh | sh
```

### Type checking not working

Check that ty is working correctly:

```bash
uvx ty@latest --version
```

## Learn More

- [ty Documentation](https://docs.astral.sh/ty) - ty is created by Astral
- [ty Editor Settings](https://docs.astral.sh/ty/reference/editor-settings/)
- [Claude Code LSP Documentation](https://code.claude.com/docs/en/plugins-reference#lsp-servers)

## About

**Plugin author**: Brian Roach

**ty type checker**: Created by [Astral](https://astral.sh), the creators of uv and Ruff

## License

MIT
