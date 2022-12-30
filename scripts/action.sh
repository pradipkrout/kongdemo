#!/bin/sh

echo "exeuction of script $0 and $1"
deck $1 --konnect-runtime-group-name $2 --konnect-token $3 --tls-skip-verify
