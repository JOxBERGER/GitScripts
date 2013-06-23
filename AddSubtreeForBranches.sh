#!/bin/sh
# Add Subtree For Branches

Repos=(00_CapacitiveCover 2_VVVV-Basics 3_ArduinoBasics 4_1_Potentiometer 4_2_Temperatursensor 4_3_Accelerometer 4_4_RFID 4_5_OneDimensionalSlider 4_6_TwoDimensionalSlider 5_1_Fiducial-Tracking 5_2_AugmentedReality 5_3_Facetracking 5_4_Colortracking 5_5_Multitouch 5_6_GestureControl 6_1_Multiscreen 6_2_2DMappingOnPlaneSurfaces 6_3_3DIllusionThroughProjectionMapping 7_1_Servomotor 7_2_VibrationMotor
)
Version=(vvvv_45beta30)
RootUrl='https://github.com/PrototypingInterfaces/'
GitRepoFolder='GIT/PrototypingInterfaces_AllPatches'
US='_'


for j in ${Version[@]}
do 
cd ~/$GitRepoFolder$US$Version

	for i in ${Repos[@]}
	do
	git subtree add --prefix $i --squash $RootUrl$i $j
	done

git add -A
git commit -m "added Subtree for Branch $j $(date +%Y.%m.%d.%H.%M)"
done
