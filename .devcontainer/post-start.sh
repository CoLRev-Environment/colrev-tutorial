#!/bin/bash

colrev install all_internal_packages
# Pull Docker images
for repo in pandoc/latex:3.2.0 lfoppiano/grobid:0.8.1 jbarlow83/ocrmypdf:latest; do
  docker pull $repo;
done;

rm -rf .devcontainer
