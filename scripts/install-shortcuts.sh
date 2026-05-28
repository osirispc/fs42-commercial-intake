#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

mkdir -p "$HOME/bin"

ln -sf "$PROJECT_DIR/scripts/commercial-one" "$HOME/bin/commercial-one"
ln -sf "$PROJECT_DIR/scripts/commercial-playlist" "$HOME/bin/commercial-playlist"

grep -q 'export PATH="$HOME/bin:$PATH"' "$HOME/.bashrc" || {
  echo 'export PATH="$HOME/bin:$PATH"' >> "$HOME/.bashrc"
}

echo "Shortcuts installed:"
echo "  commercial-one"
echo "  commercial-playlist"
echo
echo "Now run:"
echo "  source ~/.bashrc"
