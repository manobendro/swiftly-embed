#!/bin/bash
#
# GitHub Codespaces Post-Create Script
# This script runs only once when the container is first created
#

set -e  # Exit on error

echo "🎉 Running post-create setup..."

# Install development dependencies
echo "📦 Installing development dependencies..."
# sudo apt-get install -y build-essential curl wget

# Install Swift if needed for embedded Swift development
# Uncomment the following lines if you need Swift:
# echo "🐦 Installing Swift..."
# wget https://download.swift.org/swift-5.9.2-release/ubuntu2204/swift-5.9.2-RELEASE/swift-5.9.2-RELEASE-ubuntu22.04.tar.gz
# tar xzf swift-5.9.2-RELEASE-ubuntu22.04.tar.gz
# sudo mv swift-5.9.2-RELEASE-ubuntu22.04 /usr/share/swift
# echo 'export PATH=/usr/share/swift/usr/bin:$PATH' >> ~/.bashrc

# Clone any necessary repositories or submodules
echo "📥 Initializing git submodules..."
git submodule update --init --recursive 2>/dev/null || echo "No submodules found"

# Create workspace structure
echo "📁 Creating workspace structure..."
mkdir -p /workspaces/swiftly-embed/{build,dist,logs,tests}

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
