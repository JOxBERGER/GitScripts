#i/bin/sh
# Update Subtree For Branches and Push

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
source $HOME/.keychain/${HOSTNAME}-sh

Repos=(00_CapacitiveCover 2_VVVV-Basics 3_ArduinoBasics 4_1_Potentiometer 4_2_Temperatursensor 4_3_Accelerometer 4_4_RFID 4_5_OneDimensionalSlider 4_6_TwoDimensionalSlider 5_1_Fiducial-Tracking 5_2_AugmentedReality 5_3_Facetracking 5_4_Colortracking 5_5_Multitouch 5_6_GestureControl 6_1_Multiscreen 6_2_2DMappingOnPlaneSurfaces 6_3_3DIllusionThroughProjectionMapping 7_1_Servomotor 7_2_VibrationMotor)
Branches=(vvvv_45beta29.2 master)
RootUrl='https://github.com/PrototypingInterfaces/'

HOME='/home/PrototypingInterfaces/'
TemplateImage='/home/PrototypingInterfaces/GIT/GitScripts/template.png'
GitRepoPath='GIT/'
CollectionFolder='PrototypingInterfaces_AllPatches'
TMP=$(date +"%s")'PItmpfolder/'
WEB='/var/www/PrototypingInterfaces'
GITPATH='/usr/local/bin/git'
DefaultRemoteBranch='master'

US='_'
BS='/'
SyncOptions=" --exclude '.git*'"

echo "--------- Start --------------"

rm -rf $HOME$TMP # delete tmp folder
mkdir $HOME$TMP # start with making a new collection folder

for i in ${Branches[@]}
do 

echo -e "\n\n\n start working on branch "$j$US$i 
mkdir $HOME$TMP$CollectionFolder$US$i

		for j in ${Repos[@]}
		do
			
		echo -e "\n    do: go in: "$HOME$GitRepoPath$j 
		cd $HOME$GitRepoPath$j		
	
		git checkout $i
		git fetch origin $i
		git reset --hard FETCH_HEAD
		git clean -d -x -f
		
		# copy files 
		echo -e "    do: cd in tmp folder "$HOME$TMP$CollectionFolder$US$i
		#mkdir $HOME$TMP$CollectionFolder$US$i
		cd $HOME$TMP$CollectionFolder$US$i
		echo -e "    do: starts rsync"
		eval rsync --archive $SyncOptions $HOME$GitRepoPath$j/ $HOME$TMP$CollectionFolder$US$i$BS$j$US$i/
		echo -e "    do: zip content"
		zip -9 -r -q  $j$US$i.zip  $j$US$i
		mv -f $j$US$i.zip $WEB
		# generate downlaod flag
		PatchVersion=`cat version.txt`
		convert $TemplateImage -gravity SouthWest -font Armata-Regular -fill '#7ba400'  -pointsize 14 -draw "text 110,10'$version'" $j$US$i.png
		mv $j$US$i.png $WEB
		done
	
	echo "\n  do: zip collection of branch "$i
	cd $HOME$TMP
	zip -9 -r -q  $CollectionFolder$US$i.zip  $CollectionFolder$US$i
	mv -f $CollectionFolder$US$i.zip $WEB
	echo -e "\n  done! made updates for branch "$j$US$i	
	echo    "   --------------------------------------------"
	done

cd $HOME
rm -rf $HOME$TMP
echo "________________done____________________"
