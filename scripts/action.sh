#!/bin/sh

echo "exeuction of script $0 and $1"
deck ping --konnect-runtime-group-name $1 --konnect-token $2 --tls-skip-verify > konnect_ping
konnectcheck=`cat konnect_ping`
echo $konnectcheck
if [[ "$konnectcheck" == *"Successfully"* ]] ; then
echo "Inside if block"
fi
