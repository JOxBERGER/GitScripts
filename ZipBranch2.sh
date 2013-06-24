#/bin/sh
# Update Subtree For Branches and Push

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
source $HOME/.keychain/${HOSTNAME}-sh

Repos=(00_CapacitiveCover 2_VVVV-Basics 3_ArduinoBasics 4_1_Potentiometer 4_2_Temperatursensor 4_3_Accelerometer 4_4_RFID 4_5_OneDimensionalSlider 4_6_TwoDimensionalSlider 5_1_Fiducial-Tracking 5_2_AugmentedReality 5_3_Facetracking 5_4_Colortracking 5_5_Multitouch 5_6_GestureControl 6_1_Multiscreen 6_2_2DMappingOnPlaneSurfaces 6_3_3DIllusionThroughProjectionMapping 7_1_Servomotor 7_2_VibrationMotor
)
Branches=(vvvv_45beta29.2 vvvv_45beta30)
RootUrl='https://github.com/PrototypingInterfaces/'

HOME='/home/PrototypingInterfaces/'
GitRepoPath='GIT/'
CollectionFolder='PrototypingInterfaces_AllPatches'
TMP='PItmpfolder/'
WEB='/var/www/test'
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

mkdir $HOME$TMP$CollectionFolder$US$i

		for j in ${Repos[@]}
		do
			
		cd $HOME$GitRepoPath$j		
	
		git checkout $i
		
		git fetch origin $i
		git reset --hard FETCH_HEAD
		git clean -df
		
		
		# copy files 
		echo -e "\ndo: cd in tmp folder "$HOME$TMP$CollectionFolder$US$i
		#mkdir $HOME$TMP$CollectionFolder$US$i
		cd $HOME$TMP$CollectionFolder$US$i
		echo -e "\ndo: starts rsync"
		eval rsync --archive $SyncOptions $HOME$GitRepoPath$j/ $HOME$TMP$CollectionFolder$US$i$BS$j$US$i/
		echo -e "\ndo: zip content"
		zip -9 -r -q  $j$US$i.zip  $j$US$i
		mv -f $j$US$i.zip $WEB
		echo -e "\n\ndone! made updates for branch "$j$US$i
		done
		cd $HOME$TMP
		zip -9 -r -q  $CollectionFolder$US$i.zip  $CollectionFolder$US$i
		mv -f $CollectionFolder$US$i.zip $WEB
		
	done

cd $HOME

echo "________________done____________________"
