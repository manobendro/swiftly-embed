#!/bin/bash
#
# GitHub Codespaces Post-Create Script
# This script runs only once when the container is first created
#

set -e  # Exit on error

echo "🎉 Running post-create setup..."

# Install development dependencies
echo "📦 Installing development dependencies..."
apt-get update
apt-get install -y build-essential curl wget libncurses6 zlib1g

# Install Swift for embedded Swift development
# Reference: https://www.swift.org/install/linux/
echo "🐦 Installing Swift..."
mkdir -p swiftly
# Download swiftly
curl -o swiftly/swiftly-$(uname -m).tar.gz https://download.swift.org/swiftly/linux/swiftly-$(uname -m).tar.gz
# Extract swiftly archive
tar zxf swiftly/swiftly-$(uname -m).tar.gz -C swiftly
# Install swift language
# ./swiftly/swiftly init --quiet-shell-followup -y

# Clone any necessary repositories or submodules
echo "📥 Initializing git submodules..."
git submodule update --init --recursive 2>/dev/null || echo "No submodules found"

# Install any language-specific package managers or tools
# Example for Node.js projects:
# npm install -g yarn

# Set up pre-commit hooks if needed
# Example:
# if [ -f ".git/hooks" ]; then
#     echo "🪝 Setting up git hooks..."
#     # Setup your hooks here
# fi

echo ""
echo "✅ Post-create setup complete!"
echo ""
