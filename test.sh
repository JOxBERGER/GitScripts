#i/bin/sh
# Update Subtree For Branches and Push

version=`cat version.txt`
versiontext="(for $version)"
# touch "$version".xml

convert template.png -gravity SouthWest -font Armata-Regular -fill '#7ba400'  -pointsize 14 -draw "text 110,10'$version'" ausgabe.png

mv ausgabe.png /var/www/PrototypingInterfaces/ausgabe.png
