#!/bin/sh

echo "exeuction of script $0 and $1"
deck ping --konnect-runtime-group-name $1 --konnect-token $2 --tls-skip-verify > konnect_ping
konnectcheck=`cat konnect_ping`
echo $konnectcheck
##if [[ "$konnectcheck" == *"Successfully"* ]] ; then
##echo "Inside if block"
##fi
case $konnectcheck in

  *"Successfully"*)
    chmod 755 ./generate_yaml.py
    python3 ./generate_yaml.py
    deck validate --konnect-addr $3 --konnect-token $2 --konnect-runtime-group-name $1 -s $4/results/$5 > konnect_validate
    ;;
esac
konnectvalidcheck=`cat konnect_validate`
echo $konnectvalidcheck

case $konnectvalidcheck in

  *"Successfully"*)
    deck diff --konnect-token $2 --konnect-addr $3 --konnect-runtime-group-name $1 -s $4/results/$5 > konnect_diff
    deck sync --konnect-addr $3 --konnect-token $2 --konnect-runtime-group-name $1 -s $(System.DefaultWorkingDirectory)/results/${{ parameters.kong_file }}
    ;;
esac
