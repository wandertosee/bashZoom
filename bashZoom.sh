#!/bin/bash

	# ===================================================
	#
	#		bashZoom.sh
	#
	# 		vips batch process
	#
	# 		deepzoom / microsoft sea dragon image tiles
	#
	#		Colin Kennedy 2014
	#
	# ===================================================
	#
	# 	REQUIRES VIPS
	#
	# 		to install vips if brew is installed use the following 
	#
	# 			brew install vips --with-cfitsio --with-fftw --with-imagemagick --with-libexif --with-liboil --with-libtiff --with-little-cms --with-openexr --with-openslide --with-pango
	#
	#
	# 	IF BREW IS NOT INSTALLED 
	#
	#		use instructions on the following page to install brew
	#
	#	 		http://brew.sh/
	#
	#	USE
	#	
	#		run via command line
	#		
	#			sh bashZoom.sh  
	#
	#
	
	 
	MakeDeepZoom () {

		# IGNORE ROOT FOLDER "."
		# PROCESS SUB FOLDERS	
		if [ $FOLDER != "." ] 
		then
			cd "$FOLDER";
			echo $FOLDER;
			for ITEM in `find . -iname *.tif`; do vips dzsave $ITEM mydz; done;
			echo $FOLDER;
			cd "$CWD";
		fi;
	}
	
	CWD="$(pwd)"
	
	for FOLDER in `find . -type d -maxdepth 1 | sed "s/[ ]/\ /g"`; do MakeDeepZoom; done;
