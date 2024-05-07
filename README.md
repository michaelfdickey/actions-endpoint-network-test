# actions-endpoint-network-test
tests the actions endpoints for connectivity

This action will perform the following steps:

1) connect to the GitHub api `meta` endpoint to `https://api.github.com/meta` retrieve the current list of endpoints for allow listing.
2) Parse the specific endpoints under the `actions` section that end in `.actions.githubusercontent.com`
3) install `mtr-tiny` on the ubuntu vm
4) Sequentially run `mtr-tiny` command on the first 3 endpoints, surfacing the active results in the actions workflow run log (outputting the command to terminal with echo)


