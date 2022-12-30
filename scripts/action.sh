#!/bin/sh

echo "exeuction of script $0 and $1"
deck ping --konnect-runtime-group-name $1 --konnect-token $2 --tls-skip-verify > konnect_ping
if grep -q "ab" <<< "abc" ; then
echo "Inside if block"
fi
