#!/usr/bin/env bash

/usr/bin/pandoc lib/pandoc/metadata.yaml Slides.md -o Slides.html -f markdown+fenced_divs -s -t revealjs --slide-level=2 --no-highlight --template=lib/pandoc/revealjs.template.html
