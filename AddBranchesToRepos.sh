#!/bin/sh
# Add Branches to Repos
Repos=( PrototypingInterfaces_AllPatches )
Branches=(master vvvv_45beta29.2)
LocalRepoParentFolderPath="GIT/" # Enter Folder relative to home user home Folder without home Sign ~/


for j in ${Branches[@]}
do 

	for i in ${Repos[@]}
	do
		echo ~/$LocalRepoParentFolderPath$i
		cd ~/$LocalRepoParentFolderPath$i
		git branch $j
		#git add -A
		#git commit -m "added Branch $j $(date +%Y.%m.%d.%H.%M)"
	done

done
