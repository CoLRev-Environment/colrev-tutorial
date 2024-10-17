#!/bin/bash

# Pull Docker images
for repo in pandoc/latex:3.2.0 lfoppiano/grobid:0.8.1 jbarlow83/ocrmypdf:latest; do
  docker pull $repo;
done;

# Open README.md in VS Code preview mode
code README.md --reuse-window --wait
code -r --command 'markdown.showPreview'
