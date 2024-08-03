#!/bin/bash

# Exit on any error
set -e

# Function to generate Go code
generate_go() {
    for dir in proto/*/; do
        service=$(basename "$dir")
        protoc -I=proto \
            --go_out=gen/go --go_opt=paths=source_relative \
            --go-grpc_out=gen/go --go-grpc_opt=paths=source_relative \
            proto/$service/*.proto
    done
}

# Generate Go code
generate_go

# Add generation for other languages here if needed

echo "Code generation completed successfully!"