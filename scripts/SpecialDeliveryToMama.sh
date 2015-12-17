#! /bin/bash
# looks through email (dekurockshooter)
# appends terms to remove filter
# sends links to postoffices

GOTMAIL="/home/deku/.getmail/recieve/new/*.deku"
REMOVEFILTER="/home/deku/Programs/NyaaSagashi/removeFilter.txt"
POSTOFFICEQ="/home/deku/Programs/NyaaSagashi/postofficeQ"
POSTOFFICEM="/home/deku/Programs/NyaaSagashi/postofficeM"
POSTOFFICEP="/home/deku/Programs/NyaaSagashi/postofficeP"
POSTOFFICEB="/home/deku/Programs/NyaaSagashi/postofficeB"
POSTOFFICEO="/home/deku/Programs/NyaaSagashi/postofficeO"
POSTOFFICEN="/home/deku/Programs/NyaaSagashi/postofficeN"

getmail -q

for g in $GOTMAIL
do
	if [ -n $(grep -e "^\*filterStart\*$" $g) ]
	then
		sed '1,/^\*filterStart\*$/d;/^\*filterEnd\*$/,$d' $g >> $REMOVEFILTER
	fi

	if [ -n $(grep -e "^\*linkStart\*$" $g) ]
	then
		sed '1,/^\*linkStart\*$/d;/^\*linkEnd\*$/,$d' $g | grep -e "^Q" | \
			sed 's/^.//' >> $POSTOFFICEQ

		sed '1,/^\*linkStart\*$/d;/^\*linkEnd\*$/,$d' $g | grep -e "^M" | \
			sed 's/^.//' >> $POSTOFFICEM

		sed '1,/^\*linkStart\*$/d;/^\*linkEnd\*$/,$d' $g | grep -e "^P" | \
			sed 's/^.//' >> $POSTOFFICEP

		sed '1,/^\*linkStart\*$/d;/^\*linkEnd\*$/,$d' $g | grep -e "^B" | \
			sed 's/^.//' >> $POSTOFFICEB

		sed '1,/^\*linkStart\*$/d;/^\*linkEnd\*$/,$d' $g | grep -e "^O" | \
			sed 's/^.//' >> $POSTOFFICEO

		sed '1,/^\*linkStart\*$/d;/^\*linkEnd\*$/,$d' $g | grep -e "^N" | \
			sed 's/^.//' >> $POSTOFFICEN
	fi
done

rm $GOTMAIL