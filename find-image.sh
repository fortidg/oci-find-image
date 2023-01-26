#!/bin/bash

#example usage: from the bash prompt in cloud shell, in put the command with the following syntaxFortiGate ./find.sh 'Next-Gen Firewall (BYOL)' '7.2.3' 'us-ashburn-1'

export STERM="$1"

export SVERSION="$2"

export REGION="$3"


export LID=`oci raw-request --target-uri https://iaas.$REGION.oraclecloud.com/20160918/appCatalogListings --http-method GET | jq --arg STERM "$STERM" '.data[] | select ( .displayName | contains($STERM))' | jq -r '.listingId'`

oci raw-request --http-method GET --target-uri https://iaas.$REGION.oraclecloud.com/20160918/appCatalogListings/$LID/resourceVersions | jq --arg SVERSION "$SVERSION"  '.data[] | select ( .listingResourceVersion | contains($SVERSION))'
