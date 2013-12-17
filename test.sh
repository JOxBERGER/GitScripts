#i/bin/sh
# Update Subtree For Branches and Push

version=`cat version.txt`
versiontext="$version jay"
touch "$version".xml

convert tmpimage.png -gravity SouthEast -font Armata-Regular -pointsize 11 -draw "text 0,0 '$versiontext'" ausgabe.png

cp ausgabe.png /var/www/PrototypingInterfaces/ausgabe.png
