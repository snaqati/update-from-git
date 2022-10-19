#!/bin/bash

for i in "$@"; do
  case $i in
    -s=*|--source=*)
      sourcePath="${i#*=}"
      shift # past argument=value
      ;;
    -d=*|--destination=*)
      destinationPath="${i#*=}"
      shift # past argument=value
      ;;
    -r=*|--remove=*)
      removeFiles="${i#*=}"
      shift # past argument=value
      ;;
    --default)
      DEFAULT=YES
      shift # past argument with no value
      ;;
    -*|--*)
      echo "Unknown option $i"
      exit 1
      ;;
    *)
      ;;
  esac
done

if [ ! "$sourcePath" ] && [ "$sourcePath" != " " ]
then
	read -e -p "Enter the path for git repository [default=$PWD]: " sourcePath
	sourcePath=${sourcePath:=$PWD}
fi

if [ ! "$destinationPath" ] && [ "$destinationPath" != " " ]
then
	read -e -p "Enter the destination path: " destinationPath
fi

if [ ! "$removeFiles" ] && [ "$removeFiles" != " " ]
then
	read -p "Remove the files from destination before copying (yes/y/no/n) [default=no]? " removeFiles
	removeFiles=${removeFiles:=no}
fi

if [ ! -d "$sourcePath" ]
then
	echo "ERROR: Source path is invalid"
	exit 1
elif [ ! -d "$destinationPath" ]
then
	echo "ERROR: Destination path is invalid"
	exit 1
else
	echo "Update code base from git (Run as sudo to resolve access issues)"
fi

if [ "$sourcePath" ] && [ "$destinationPath" ] && [ "$removeFiles" ]
then
	echo "
	Source path is: $sourcePath
	Destination path is: $destinationPath
	Remove destination files before copying updated files: $removeFiles
	"

	read -p "Continue? (yes/y/no/n) " confirmation
else
	echo "Please enter all required details to proceed"
fi

if [ "$confirmation" == "yes" ] || [ "$confirmation" == "y" ]
then
	cd $sourcePath
	git pull
 
	if [ "$removeFiles" == "yes" ] || [ "$removeFiles" == "y" ] || [ "$removeFiles" == "true" ]
	then
    	rm -r $destinationPath/*
    	cp -r ./* $destinationPath/
    	echo "Removed existing files and copied updated files"
	else
    	cp -r ./* $destinationPath/
    	echo "Copied updated files"
	fi
	else
		echo "Exiting"	
fi

