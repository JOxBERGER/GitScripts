#i/bin/sh
# Update Subtree For Branches and Push

value=`cat version.txt`
touch "$value".xml

convert tmpimage.jpeg -gravity SouthEast -font Times-Bold -pointsize 72 -draw "text 0,0 'Hallo Welt'" ausgabe.png