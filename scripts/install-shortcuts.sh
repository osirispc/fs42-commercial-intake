#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "$(readlink -f "${BASH_SOURCE[0]}")")/.." && pwd)"
BIN_DIR="$HOME/bin"

mkdir -p "$BIN_DIR"

ln -sf "$PROJECT_DIR/scripts/commercial-one" "$BIN_DIR/commercial-one"
ln -sf "$PROJECT_DIR/scripts/commercial-playlist" "$BIN_DIR/commercial-playlist"
ln -sf "$PROJECT_DIR/scripts/commercial-mark" "$BIN_DIR/commercial-mark"
ln -sf "$PROJECT_DIR/scripts/commercial-cut-list" "$BIN_DIR/commercial-cut-list"
ln -sf "$PROJECT_DIR/scripts/commercial-menu" "$BIN_DIR/commercial-menu"

grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc" || echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"

echo "Shortcuts installed:"
echo "  commercial-one"
echo "  commercial-playlist"
echo "  commercial-mark"
echo "  commercial-cut-list"
echo "  commercial-menu"
echo
echo "Now run:"
echo "  source ~/.bashrc"
