#!/bin/bash
#
# GitHub Codespaces Initialization Script
# This script runs every time the container starts
#

set -e  # Exit on error

echo "🚀 Starting Swiftly Embed initialization..."

# Update package lists
echo "📦 Updating package lists..."
sudo apt-get update -qq

# Install any runtime dependencies here
# Example: sudo apt-get install -y <package-name>

# Set up environment variables
echo "🔧 Setting up environment..."
export WORKSPACE_DIR="/workspaces/swiftly-embed"

# Create common directories if they don't exist
mkdir -p "$WORKSPACE_DIR/build"
mkdir -p "$WORKSPACE_DIR/dist"
mkdir -p "$WORKSPACE_DIR/logs"

# Set proper permissions
echo "🔐 Setting permissions..."
chmod -R 755 "$WORKSPACE_DIR/build" 2>/dev/null || true
chmod -R 755 "$WORKSPACE_DIR/dist" 2>/dev/null || true

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
echo "👋 Welcome to Swiftly Embed development environment"
echo ""
