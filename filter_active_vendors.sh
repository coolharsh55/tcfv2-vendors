# !/bin/bash

echo -e "ID\tNAME\tPOLICY\tSTATUS"
while read -r LINE ; do
	op1=$(echo "$LINE" | cut -f1)
	# echo $op1
	op2=$(grep "^${op1}$" vendors_deleted.txt)
	if [[ -z "$op2" ]] ; then
		echo -e $LINE
	fi
done < policies_errors.tsv