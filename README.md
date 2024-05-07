# actions-endpoint-network-test
tests the actions endpoints for connectivity

This action will perform the following steps:

1) Connect to the GitHub API `meta` endpoint to `https://api.github.com/meta` retrieve the current list of endpoints for allow listing.
2) Parse the specific endpoints under the `actions` section that end in `.actions.githubusercontent.com`
3) Install `mtr-tiny` on the ubuntu VM.
4) Sequentially run `mtr-tiny` command on the first 3 endpoints, surfacing the active results in the actions workflow run log. This is now implemented directly in the `network-test.sh` script, ensuring that `mtr-tiny` is executed on the first three lines of the output from the script, providing concise and relevant connectivity diagnostics.

