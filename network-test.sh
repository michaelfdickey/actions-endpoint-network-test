#!/bin/bash

# Fetch the GitHub API meta endpoint
endpoints=$(curl -s https://api.github.com/meta | jq -r '.actions[] | select(endswith(".actions.githubusercontent.com"))')

# Install mtr-tiny on the Ubuntu VM
sudo apt-get update && sudo apt-get install -y mtr-tiny

# Sequentially run mtr-tiny command on the first 3 endpoints
for endpoint in $(echo "$endpoints" | head -n 3); do
    echo "Running mtr-tiny for endpoint: $endpoint"
    mtr --report --report-cycles=10 $endpoint
done
