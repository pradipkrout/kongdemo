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
    mkdir results
    datenow=$(date "+%F-%H-%M-%S")
    echo "date now is $datenow"
    deck validate --konnect-runtime-group-name $1 --konnect-token $2 --konnect-addr $3 -s $4/$6/$5 > konnect_validate
    declvalidatechk=`cat konnect_ping`
    echo $declvalidatechk
    ;;
esac

case $konnectcheck in

  *"Error"*)
    
    echo "Error in declarative file"
    exit
    ;;
esac
inso run test PetTestSuite
chmod 755 ./generate_yaml.py
python3 ./generate_yaml.py 'mockbin' 'dev'
sed -i 's/x-api-key-value/abbbeeeeddddddd/g' $5/$6
deck diff --konnect-runtime-group-name $1 --konnect-token $2 --konnect-addr $3 -s $5/$6 > konnect_diff
deck sync --konnect-runtime-group-name $1 --konnect-token $2 --konnect-addr $3 -s $5/$6 > konnect_sync
