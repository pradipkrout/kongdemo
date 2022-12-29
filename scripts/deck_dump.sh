#!/bin/bash

if [ $# -eq 0 ]; then
 echo "Please check arguments detail"
 exit
else
 while getopts "t:a:r:s:" flag
    do
             case "${flag}" in
                    t) KONNECT_TOKEN=${OPTARG};;
                    a) KONNECT_ADDR=${OPTARG};;
                    r) KONNECT_RUNTIME_GROUP=${OPTARG};;
                    s) SELECT_TAGS=${OPTARG};;
             esac
    done
    echo "KONNECT_TOKEN: $KONNECT_TOKEN";
    echo "KONNECT_ADDR: $KONNECT_ADDR";
    echo "KONNECT_RUNTIME_GROUP: $KONNECT_RUNTIME_GROUP";
    echo "SELECT_TAGS: $SELECT_TAGS";
    deck ping --konnect-runtime-group-name $KONNECT_RUNTIME_GROUP --konnect-token $KONNECT_TOKEN --konnect-addr $KONNECT_ADDR  --tls-skip-verify
    mkdir results
    datenow=$(date "+%F-%H-%M-%S")
    echo "date now is $datenow"
    deck dump --konnect-runtime-group-name $KONNECT_RUNTIME_GROUP --konnect-token $KONNECT_TOKEN --konnect-addr $KONNECT_ADDR --select-tag $SELECT_TAGS --yes --format yaml --output-file results/konnect-${datenow}.yaml --tls-skip-verify
   
fi
