#!/bin/sh
set -eu

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$ROOT_DIR"
./scripts/prepare.sh

git add index.html en.html en-ai.html styles.css ru.pdf en.pdf en-ai.pdf \
  README.md scripts/prepare.sh scripts/deploy.sh
if ! git diff --cached --quiet; then
  git commit -m "Update resume content and PDFs"
fi
git push
