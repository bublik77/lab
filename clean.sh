#!/bin/bash

VIDEOS="$(pwd)/videos"
IMAGES="$(pwd)/images"
MUSIC="$(pwd)/musics"
DIR_CURRENT="$(pwd)"
[ -d $VIDEOS ] || mkdir $VIDEOS
[ -d $IMAGES ] || mkdir $IMAGES
[ -d $MUSIC ] || mkdir $MUSIC

checks(){

	if [[ $1 =~ ".mp3" ]] || [[ $1 =~ ".flac" ]]
    then
       	mv $1 $MUSIC
    elif [[ $1 =~ ".mov" ]] || [[ $1 =~ ".avi" ]]
    then
       	mv $1 $VIDEOS
    elif [[ $1 =~ ".jpg" ]] || [[ $1 =~ ".png" ]]
    then
    	mv $1 $IMAGES
    elif [[ $1 =~ ".log" ]]
    then
       	rm $1
    fi
}


for i in $DIR_CURRENT/*
do
	if [[ -f $i ]]
	then
		checks $i
	elif [[ -d $i ]] && ! [[ $i == $VIDEOS ]] && ! [[ $i == $IMAGES ]] && ! [[ $i == $MUSIC ]]
	then
		cd $i
		for j in $i/*
		do
			checks $j
		done
	fi
done
