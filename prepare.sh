#!/bin/sh

set -e

python3 translate.py

chromium-browser --headless \
  --print-to-pdf="./ru.pdf" \
  --no-pdf-header-footer \
  `pwd`/index.html

chromium-browser --headless \
  --print-to-pdf="./en.pdf" \
  --no-pdf-header-footer \
  `pwd`/en.html
