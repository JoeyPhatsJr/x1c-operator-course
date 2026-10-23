#!/bin/sh
# Rebuilds index.html (the GitHub Pages site) from x1c-operator-course.html,
# the editable source that is also published as the Claude artifact.
set -e
cd "$(dirname "$0")"
SRC=x1c-operator-course.html
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  sed -n '1,/^<\/style>/p' "$SRC"
  printf '</head>\n<body>\n'
  sed -n '/^<\/style>/,$p' "$SRC" | sed '1d'
  printf '</body>\n</html>\n'
} > index.html
echo "index.html rebuilt"
