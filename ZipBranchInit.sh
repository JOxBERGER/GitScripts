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
TMP='PItmpfolder/'
WEB='/var/www/PrototypingInterfaces'
GITPATH='/usr/local/bin/git'
DefaultRemoteBranch='master'

US='_'
SyncOptions=" --exclude '.git*'"

echo "--------- Start --------------"

for i in ${Repos[@]}
do 
	# only once!
	cd $HOME$GitRepoPath
	git clone $RootUrl$i
	#########
	
	done

cd $HOME

echo "________________done____________________"