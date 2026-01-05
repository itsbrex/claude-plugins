# cc-plugins

A collection of Claude Code plugins by [@itsbrex](https://github.com/itsbrex).

## Available Plugins

| Plugin | Description |
|--------|-------------|
| [ty-lsp](./ty-lsp-plugin/) | Python type checking via [ty](https://docs.astral.sh/ty) - an extremely fast type checker by Astral |

## Installation

### From GitHub

Add this marketplace and install plugins:

```bash
# Add the marketplace
/plugin marketplace add itsbrex/claude-plugins

# Install a plugin
/plugin install ty-lsp@cc-plugins
```

### Update Plugins

```bash
/plugin marketplace update cc-plugins
```

## Local Development

```bash
git clone https://github.com/itsbrex/claude-plugins.git
cd claude-plugins

# Add as local marketplace
/plugin marketplace add ./

# Install plugin
/plugin install ty-lsp@cc-plugins

# Update after changes
/plugin marketplace update cc-plugins
```

## Repository Structure

```
claude-plugins/
├── .claude-plugin/
│   └── marketplace.json      # Marketplace catalog
├── ty-lsp-plugin/            # ty LSP plugin
│   ├── .claude-plugin/
│   │   └── plugin.json       # Plugin manifest
│   ├── .lsp.json             # LSP configuration
│   └── ...
└── README.md
```

## Adding New Plugins

1. Create a new directory for your plugin (e.g., `my-plugin/`)
2. Add `.claude-plugin/plugin.json` with plugin metadata
3. Add your plugin files (commands, hooks, LSP config, etc.)
4. Register in `.claude-plugin/marketplace.json`:

```json
{
  "name": "my-plugin",
  "source": "./my-plugin",
  "description": "Description of your plugin"
}
```

## Documentation

- [Claude Code Plugin Documentation](https://docs.anthropic.com/en/docs/claude-code/plugins)
- [ty Documentation](https://docs.astral.sh/ty)

## License

MIT
