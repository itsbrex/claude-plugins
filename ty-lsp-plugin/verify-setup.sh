#!/bin/bash
# Verify that the ty LSP plugin prerequisites are met

set -e

echo "🔍 Verifying ty LSP Plugin Prerequisites..."
echo ""

# Check for uvx
echo "1. Checking for uvx..."
if command -v uvx &> /dev/null; then
    echo "   ✅ uvx found: $(which uvx)"
    uvx --version
else
    echo "   ❌ uvx not found"
    echo "   Install uv (includes uvx): curl -LsSf https://astral.sh/uv/install.sh | sh"
    exit 1
fi

echo ""

# Check if ty can be run
echo "2. Checking if ty can be installed/run via uvx..."
if uvx ty@latest --version &> /dev/null; then
    echo "   ✅ ty works via uvx"
    uvx ty@latest --version
else
    echo "   ❌ ty failed to run via uvx"
    exit 1
fi

echo ""

# Check if server command exists
echo "3. Checking if ty server command starts..."
# Start server in background, wait briefly, then check if it's running
uvx ty@latest server &> /dev/null &
SERVER_PID=$!
sleep 0.5

if ps -p $SERVER_PID > /dev/null 2>&1; then
    echo "   ✅ Server started successfully (process $SERVER_PID is running)"
    kill $SERVER_PID 2> /dev/null
    wait $SERVER_PID 2> /dev/null || true
else
    echo "   ❌ Server failed to start or exited early"
    exit 1
fi

echo ""

# Check plugin structure
echo "4. Checking plugin structure..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if [ -f "$SCRIPT_DIR/.claude-plugin/plugin.json" ]; then
    echo "   ✅ plugin.json found"
else
    echo "   ❌ plugin.json not found"
    exit 1
fi

if [ -f "$SCRIPT_DIR/.lsp.json" ]; then
    echo "   ✅ .lsp.json found"
else
    echo "   ❌ .lsp.json not found"
    exit 1
fi

echo ""
echo "✨ All checks passed! The plugin is ready to use."
echo ""
echo "To test the plugin, run:"
echo "  claude --plugin-dir $SCRIPT_DIR"
