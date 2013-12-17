#i/bin/sh
# Update Subtree For Branches and Push

value=`cat version.txt`
touch "$value".xml

convert tmpimage.png -gravity SouthEast -font Helvetica -pointsize 72 -draw "text 0,0 $value" ausgabe.png

cp ausgabe.png /var/www/PrototypingInterfaces/ausgabe.png
