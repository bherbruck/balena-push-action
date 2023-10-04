# Balena push docker action

This action pushes a docker image to balena registry.

## Inputs

### `balena-api-key`

## Example usage

```yaml
name: Balena Push

on:
  workflow_dispatch:

jobs:
  balena-push:
    runs-on: ubuntu-latest

    steps:
      - name: Checkout
        uses: actions/checkout@v3
      
      - name: Balena Push
        uses: bherbruck/balena-push@v1
        with:
          balena-api-token: ${{ secrets.BALENA_API_KEY }}
          balena-app-name: ${{ vars.BALENA_APP_NAME }}


``` 