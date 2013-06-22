#!/bin/sh
# Add Branch and Push Changes
Repos=( TestRepoAll )
Branches=(master vvvv_45beta29.2)
#RootUrl='git@github.com:PrototypingInterfaces/TestRepoAll.git'
LocalRepoParentFolderPath="GIT/" # Enter Folder relative to home user home Folder without home Sign ~/


for j in ${Branches[@]}
do 

	for i in ${Repos[@]}
	do
		echo ~/$LocalRepoParentFolderPath$i
		cd ~/$LocalRepoParentFolderPath$i
		git branch $j
		git push origin $j
	done

done
