 #! /bin/bash
 # -move videos to their respective directories
 # -videos must be in the form *.* (ie, contain a period)
 # -directories must not contain a '.' in their name
 # -moves a video if there's only one that matches a directory
 #
 # -Loops through directories and checks if any videos
 # contains its name

 DIR="/run/media/deku/Base/virtual/tera/anime/new/"


cd "$DIR"
FILES="./*/" # all directories

for f in $FILES
do
	PATTERN=$(echo $f | tr -d [/.]) # name of directory without '/' and '.'

	# show only contents that have a '.' in their name
	# then check if any of the contents contain the name of the directory
	RESULTS=$(ls "$DIR" | grep -i -e "[.]" | grep -i -e "$PATTERN")
	if [ -n "$RESULTS" ]
	then
		mv "$RESULTS" "$f"
	fi

done