#!/bin/bash

# Fetch the data from the URL
data=$(curl -s https://api.github.com/meta)

# Parse the JSON and extract the "actions" section under "domains"
actions=$(echo "$data" | jq -r '.domains.actions[]')

# Filter the "actions" section to only keep endpoints that end with "actions.githubusercontent.com"
actions=$(echo "$actions" | grep 'actions\.githubusercontent\.com$')

# Print the filtered "actions" section
echo "$actions"
