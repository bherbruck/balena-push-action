#!/bin/bash

echo using token $1
echo using app $2

BALENA_DIR=$HOME/balena-cli

echo "Installing balena-cli"
curl https://raw.githubusercontent.com/bherbruck/install-balena-cli/main/install-balena-cli |
  bash -s $BALENA_DIR

echo "Logging into balena"
$BALENA_DIR/balena login --token $1

echo "Pushing to balena"
$BALENA_DIR/balena push $2
