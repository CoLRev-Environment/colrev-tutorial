#!/bin/bash

set -u

# Ensure that the colrev package is available before using it. When the
# Codespaces image cache does not include the dependency, installing it on
# demand keeps the setup reproducible for new workspaces as well as locally.
if ! command -v colrev >/dev/null 2>&1; then
  if ! python -m pip install --no-cache-dir "git+https://github.com/CoLRev-Environment/colrev"; then
    echo "Warning: Failed to install colrev automatically." >&2
  fi
fi

colrev install all_internal_packages
# Pull Docker images
for repo in pandoc/latex:3.2.0 lfoppiano/grobid:0.8.1 jbarlow83/ocrmypdf:latest; do
  docker pull $repo;
done;

rm -rf .devcontainer
