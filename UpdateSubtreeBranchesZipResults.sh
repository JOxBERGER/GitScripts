#/bin/sh
# Update Subtree For Branches and Push

PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games
source $HOME/.keychain/${HOSTNAME}-sh

Repos=(00_CapacitiveCover 2_VVVV-Basics 3_ArduinoBasics 4_1_Potentiometer 4_2_Temperatursensor 4_3_Accelerometer 4_4_RFID 4_5_OneDimensionalSlider 4_6_TwoDimensionalSlider 5_1_Fiducial-Tracking 5_2_AugmentedReality 5_3_Facetracking 5_4_Colortracking 5_5_Multitouch 5_6_GestureControl 6_1_Multiscreen 6_2_2DMappingOnPlaneSurfaces 6_3_3DIllusionThroughProjectionMapping 7_1_Servomotor 7_2_VibrationMotor
)
Version=(vvvv_45beta29.2 vvvv_45beta30)
RootUrl='https://github.com/PrototypingInterfaces/'

HOME='/home/PrototypingInterfaces/'
GitRepoPath='GIT/'
GitRepoFolder='PrototypingInterfaces_AllPatches'
TMP='PItmp/'
WEB='/var/www/PrototypingInterfaces'
GITPATH='/usr/local/bin/git'
DefaultRemoteBranch='master'

US='_'
SyncOptions=" --exclude '.git*'"

echo "--------- Start --------------"

for j in ${Version[@]}
do 
	cd $HOME$GitRepoPath$GitRepoFolder$US$j
	echo -e "\ndo: checkout" $j

		for i in ${Repos[@]}
		do
		echo 
		echo -e "\n\ndo: update subtree "$i" for branch "$j 
		$GITPATH subtree pull --prefix $i --squash $RootUrl$i $j -m "updated subtree $i $(date +%Y.%m.%d.%H.%M)" 
		done
	echo -e "\ndo: git add"
	$GITPATH add -A
	echo -e "\ndo: git commit"
	$GITPATH commit -m "update"
	echo -e "\ndo: git push "$j
	$GITPATH push --force origin $DefaultRemoteBranch # uncommet to push files to master remote

	#  copy files to the web folder /var/www
	rm -rf $HOME$TMP
	mkdir $HOME$TMP
	echo -e "\ndo: checkout "$j
	$GITPATH checkout $j
	echo -e "\ndo: cd in tmp folder "$HOME$TMP
	cd $HOME$TMP
	echo -e "\ndo: starts rsync"
	eval rsync --archive $SyncOptions $HOME$GitRepoPath$GitRepoFolder$US$j/ $HOME$TMP$GitRepoFolder$US$j/
	echo -e "\ndo: zip content"
	zip -9 -r -q  $GitRepoFolder$US$j.zip  $GitRepoFolder$US$j
	mv -f $HOME$TMP$GitRepoFolder$US$j.zip $WEB
	rm -rf $HOME$TMP
	echo -e "\n\ndone! made updates for branch "$GitRepoFolder$US$j
done

cd $HOME

echo "________________done____________________"
