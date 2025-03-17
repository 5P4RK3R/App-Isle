#!/bin/bash

# Change to the script directory
cd "$(dirname "$0")"

# Command file for Sphinx documentation

# Set default values for variables if not set
if [ -z "$SPHINXBUILD" ]; then
  SPHINXBUILD=sphinx-build
fi
SOURCEDIR=source
BUILDDIR=build

# Check if sphinx-build command is available
if ! command -v $SPHINXBUILD &> /dev/null; then
  echo
  echo "The 'sphinx-build' command was not found. Make sure you have Sphinx"
  echo "installed, then set the SPHINXBUILD environment variable to point"
  echo "to the full path of the 'sphinx-build' executable. Alternatively you"
  echo "may add the Sphinx directory to PATH."
  echo
  echo "If you don't have Sphinx installed, grab it from"
  echo "https://www.sphinx-doc.org/"
  exit 1
fi

# Check if a command argument is provided
if [ -z "$1" ]; then
  $SPHINXBUILD -M help $SOURCEDIR $BUILDDIR ${SPHINXOPTS} ${O}
  exit 0
fi

# Run sphinx-build with provided arguments
$SPHINXBUILD -M "$1" $SOURCEDIR $BUILDDIR ${SPHINXOPTS} ${O}

