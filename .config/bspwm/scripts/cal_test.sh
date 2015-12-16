cal -m | sed -r -e "s/(^| )$(date +'%d')($| )/\1^bg(#aaa5ad) ^fg(#130f1c)\2^fg()^bg()\3/") | dzen2 -x 957 -y 0 -w 200 -h 17 -l 8 -sa c -p -e 'onstart=uncollapse,hide;button3=exit;' -tw 
