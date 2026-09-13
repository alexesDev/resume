#!/bin/sh
# Render the maintained HTML versions without translating or overwriting them.
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"

if [ -n "${CHROMIUM_BIN:-}" ]; then
  BROWSER_BIN=$CHROMIUM_BIN
else
  BROWSER_BIN=
  for candidate in chromium-browser chromium google-chrome; do
    if command -v "$candidate" >/dev/null 2>&1; then
      BROWSER_BIN=$(command -v "$candidate")
      break
    fi
  done
fi
if [ -z "$BROWSER_BIN" ]; then
  echo "Chromium not found. Install Chromium or set CHROMIUM_BIN." >&2
  exit 1
fi

for version in ru en en-ai; do
  case "$version" in
    ru) source=index.html ;;
    *) source=$version.html ;;
  esac
  "$BROWSER_BIN" --headless --disable-gpu \
    --print-to-pdf="$ROOT_DIR/$version.pdf" \
    --no-pdf-header-footer \
    "file://$ROOT_DIR/$source"
done
