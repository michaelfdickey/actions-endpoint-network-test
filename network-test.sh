#!/bin/bash

# Fetch the GitHub API meta endpoint
endpoints=$(curl -s https://api.github.com/meta | jq -r '.actions[] | select(endswith(".actions.githubusercontent.com"))')

# Extract the first 3 endpoints and format them into JSON
endpoints_json=$(echo "$endpoints" | head -n 3 | jq -R . | jq -s .)

# Echo the JSON formatted endpoints
echo "Extracted endpoints in JSON format: $endpoints_json"

# Sequentially run mtr-tiny command on the first 3 endpoints
for endpoint in $(echo "$endpoints" | head -n 3); do
    echo "Running mtr-tiny for endpoint: $endpoint"
    mtr --report --report-cycles=10 $endpoint
done
