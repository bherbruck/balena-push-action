# Balena push docker action

A github action to push a docker image to balena.

## Inputs

### `balena-api-key`

**Required** The balena api key to use for authentication.

### `balena-app-name`

**Required** The balena app name to push to.

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
        uses: bherbruck/balena-push-action@v0.2
        with:
          balena-api-key: ${{ secrets.BALENA_API_KEY }}
          balena-app-name: ${{ vars.BALENA_APP_NAME }}


``` 
