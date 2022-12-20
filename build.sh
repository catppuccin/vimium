#!/usr/bin/env bash

src='./src/'
dist='./dist/'

if [ ! -d "$dist" ]; then
  mkdir -v $dist
fi

for f in "$src"/palettes/*.css; do
  filename=$(basename "$f")
  palette=${filename%.css}
  basefile=catppuccin-vimium-base.css
  filename=${basefile/base/$palette}
  echo "Creating $dist$filename"
  cat  "$f" "$src$basefile" > "$dist$filename"
done
