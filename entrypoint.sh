#!/bin/bash

echo using token $1
echo using app $2

echo "Logging into balena"
~/balena-cli/balena login --token $1

echo "Pushing to balena"
~/balena-cli/balena push $2
