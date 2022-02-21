#!/bin/bash

vendor_info=$(cat tcf-vendor-list-with-purposes.json | jq -r '.vendors | .[] |  .id, .name, .policyUrl')
echo -e "ID\tNAME\tPOLICY\tSTATUS"
while read -r ID ; do
	read -r NAME ;
	read -r POLICY ;
	STATUS=$(curl -IL -s --connect-timeout 30 --max-time 30 "$POLICY" | grep "HTTP/" | awk '{print $2}' | tail -n 1)
	if [[ -z "$STATUS" ]]; then
		STATUS="error"
	fi
	echo -e "${ID}\t${NAME}\t${POLICY}\t${STATUS}"
done <<< "$vendor_info"
