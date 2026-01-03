#!/bin/bash

# install.sh - Install clipboard image tools for Claude Code in WSL

set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

echo "Installing pimg command..."

# Install pimg to user's local bin
mkdir -p ~/.local/bin
cp "$SCRIPT_DIR/pimg" ~/.local/bin/
chmod +x ~/.local/bin/pimg

# Make sure ~/.local/bin is in PATH
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo ""
    echo "Adding ~/.local/bin to PATH in your shell config..."
    
    if [ -f ~/.zshrc ]; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.zshrc
        echo "Added to ~/.zshrc"
    fi
    
    if [ -f ~/.bashrc ]; then
        echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
        echo "Added to ~/.bashrc"
    fi
    
    echo ""
    echo "⚠️  Run 'source ~/.bashrc' or 'source ~/.zshrc' or restart your terminal"
fi

echo "Installing Claude Code slash command..."

# Install slash command (user-level, works in all projects)
mkdir -p ~/.claude/commands
cp "$SCRIPT_DIR/commands/paste-image.md" ~/.claude/commands/

echo ""
echo "✅ Installation complete!"
echo ""
echo "Usage in Claude Code:"
echo "  /paste-image              - Paste with auto-generated filename"
echo ""
echo "/paste-image Whats in this image?"
echo ""
echo "Or run directly in terminal:"
echo "  pimg                      - Outputs the saved file path"
echo ""
