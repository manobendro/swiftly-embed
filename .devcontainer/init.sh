#!/bin/bash
#
# GitHub Codespaces Initialization Script
# This script runs every time the container starts
#

set -e  # Exit on error

echo "🚀 Starting Swiftly Embeded initialization..."

# Update package lists
echo "📦 Updating package lists..."
sudo apt-get update -qq

# Git configuration
if [ ! -z "$GITHUB_USER" ]; then
    echo "⚙️  Configuring git..."
    git config --global user.name "$GITHUB_USER" || true
fi

# Display system information
echo "ℹ️  System Information:"
echo "  - OS: $(lsb_release -ds)"
echo "  - Kernel: $(uname -r)"
echo "  - User: $(whoami)"
echo "  - Workspace: $WORKSPACE_DIR"

# Display versions of key tools
echo ""
echo "📋 Tool Versions:"
git --version 2>/dev/null || echo "  - Git: not installed"

# Custom initialization for your project
# Add any project-specific setup commands here
# Examples:
# - Install dependencies
# - Build project
# - Start services
# - Run database migrations
# - etc.

echo ""
echo "✅ Initialization complete!"
echo ""

# Swiftly env setup
# . "${SWIFTLY_HOME_DIR:-$HOME/.local/share/swiftly}/env.sh"
# hash -r