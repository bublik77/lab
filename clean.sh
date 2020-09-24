#!/bin/bash

VIDEOS="$(pwd)/videos"
IMAGES="$(pwd)/images"
MUSIC="$(pwd)/musics"
DIR_CURRENT="$(pwd)"
[ -d $VIDEOS ] || mkdir $VIDEOS
[ -d $IMAGES ] || mkdir $IMAGES
[ -d $MUSIC ] || mkdir $MUSIC

checks(){
	if [[ -f $1 ]]
        then
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
        elif [[ -d $1 ]] && ! [[ $1 == $VIDEOS ]] && ! [[ $1 == $IMAGES ]] && ! [[ $1 == $MUSIC ]]
        then
               	cd $1
               	for j in $1/*
               	do
                       	if [[ $j =~ ".mp3" ]] || [[ $j =~ ".flac" ]]
                       	then
                               	mv $j $MUSIC
                       	elif [[ $j =~ ".mov" ]] || [[ $j =~ ".avi" ]]
                       	then
                               	mv $j $VIDEOS
                       	elif [[ $j =~ ".jpg" ]] || [[ $j =~ ".png" ]]
                       	then
                               	mv $j $IMAGES
                       	elif [[ $j =~ ".log" ]]
                       	then
                               	rm $j
                       	fi
               	done
       	fi
}


for i in $DIR_CURRENT/*
do
	checks $i
done
