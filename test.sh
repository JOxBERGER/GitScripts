#i/bin/sh
# Update Subtree For Branches and Push

version=`cat version.txt`
versiontext="(for $version)"
# touch "$version".xml

convert template.png -gravity SouthEast -font Armata-Regular -pointsize 11 -draw "text 0,0 '$versiontext'" ausgabe.png

mv ausgabe.png /var/www/PrototypingInterfaces/ausgabe.png
