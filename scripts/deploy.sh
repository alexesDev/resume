#!/bin/sh

set -e

commit_message=$1

if [ -z "$commit_message" ]; then
  echo "Usage: $0 <commit message>"
  exit 1
fi

echo "Preparing to push..."

./scripts/prepare.sh

git add .
git commit -m "$commit_message" || true
git push
