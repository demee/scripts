#!/bin/bash -x

DIR=${1:-`pwd`};

echo "Updating git repositories in" $DIR;

if [ ! -d "$DIR" ]; then
	echo $DIR " directory does not exists.";
fi

echo "Updating git repositories in" $DIR;

#REPOS=`find $DIR -name .git -type d -prune`

for d in `ls $DIR`; do 
	repo=$DIR/$d;			
	if [ -d "$repo" ]; then 
		if [ -e "$repo/.ignore" ]; then 
			echo "Ignoring $repo"; 
		else [A
			cd $repo;
			if [ -d ".git" ]; then
				git stash
				git checkout master
				git pull 
			fi 	
		fi 
		
	fi
done;	