#!/bin/sh

set -e

echo "Preparing to push..."

./scripts/prepare.sh

git add en.html ru.pdf en.pdf
git commit -m "prepare generated content" || true # or skip
git push
