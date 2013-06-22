#/bin/sh
# Update Subtree For Branches and Push

Repos=(00_CapacitiveCover 2_VVVV-Basics 3_ArduinoBasics 4_1_Potentiometer 4_2_Temperatursensor 4_3_Accelerometer 4_4_RFID 4_5_OneDimensionalSlider 4_6_TwoDimensionalSlider 5_1_Fiducial-Tracking 5_2_AugmentedReality 5_3_Facetracking 5_4_Colortracking 5_5_Multitouch 5_6_GestureControl 6_1_Multiscreen 6_2_2DMappingOnPlaneSurfaces 6_3_3DIllusionThroughProjectionMapping 7_1_Servomotor 7_2_VibrationMotor
)
Branches=(master vvvv_45beta29.2)
RootUrl='https://github.com/PrototypingInterfaces/'
GitRepoPath='GIT/'
GitRepoFolder='PrototypingInterfaces_AllPatches'
US='_'
SyncOptions=" --exclude '.git*'"


cd ~/$GitRepoPath$GitRepoFolder/

for j in ${Branches[@]}
do 
	git checkout $j
		for i in ${Repos[@]}
		do
		git subtree pull --prefix $i --squash $RootUrl$i $j -m "updated subtree $i $(date +%Y.%m.%d.%H.%M)"
		done
#git add -A
#git push origin $j --force # uncommet to push files to master remote

# copy files to the web folder /var/www
	rm -rf ~/tmpGIT
	mkdir ~/tmpGIT
	git checkout $j
	eval rsync --archive $SyncOptions ~/$GitRepoPath/$GitRepoFolder/ ~/tmpGIT/$GitRepoFolder$US$j/
	zip -9 -r ~/tmpGIT/$GitRepoFolder$US$j.zip  ~/tmpGIT/$GitRepoFolder$US$j/
	mv -f ~/tmpGIT/$GitRepoFolder$US$j.zip /var/www/
	rm -rf ~/tmpGIT

done
