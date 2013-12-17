#i/bin/sh
# Update Subtree For Branches and Push

version=`cat version.txt`
versiontext="(for $version)"
# touch "$version".xml

convert template.png -gravity SouthWest -font Armata-Regular -fill '#333333'  -pointsize 21 -draw "text 40,10 '$version'" ausgabe.png

mv ausgabe.png /var/www/PrototypingInterfaces/ausgabe.png
