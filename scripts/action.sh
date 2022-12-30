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
    echo -n "It's there."
     mkdir results
    datenow=$(date "+%F-%H-%M-%S")
    echo "date now is $datenow"
    deck dump --konnect-runtime-group-name $1 --konnect-token $2 --konnect-addr $3 --select-tag $4 --yes --format yaml --output-file results/konnect-${datenow}.yaml --tls-skip-verify
    cat results/konnect-${datenow}.yaml
    ;;
esac
