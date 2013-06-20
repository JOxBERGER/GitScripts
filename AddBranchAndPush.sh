#!/bin/sh
# Add Branch and Push Changes
Repos=( name )
Branches=(A B C)
RootUrl='https://github.com/PrototypingInterfaces/'
LocalRepoFolder='~/PI-GIT/'

cd $GitRepoFolder

for j in ${Branches[@]}
do 

	for i in ${Repos[@]}
	do
		git checkout $j
		git add -A
		git commit -m "added Branch" $j $(date +%Y.%m.%d.%H.%M)'"'
		git push
	done

done