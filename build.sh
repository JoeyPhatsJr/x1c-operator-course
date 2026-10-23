#!/bin/sh
# Rebuilds index.html (the GitHub Pages site) from x1c-operator-course.html,
# the editable source that is also published as the Claude artifact.
set -e
cd "$(dirname "$0")"
SRC=x1c-operator-course.html
{
  printf '<!doctype html>\n<html lang="en">\n<head>\n<meta charset="utf-8">\n<meta name="viewport" content="width=device-width, initial-scale=1, viewport-fit=cover">\n'
  printf '<link rel="icon" href="favicon.svg" type="image/svg+xml">\n<link rel="icon" href="favicon-32.png" sizes="32x32" type="image/png">\n<link rel="apple-touch-icon" href="apple-touch-icon.png">\n<meta name="theme-color" content="#0F1214">\n'
  sed -n '1,/^<\/style>/p' "$SRC"
  printf '</head>\n<body>\n'
  sed -n '/^<\/style>/,$p' "$SRC" | sed '1d'
  printf '</body>\n</html>\n'
} > index.html
echo "index.html rebuilt"
