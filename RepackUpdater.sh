#!/bin/bash
#This is the updater script for FitFirl-Repack-List.txt, to create an up to date version within the current directory
#Use the script.sh in the repo for extraction of download mirrors for each repack.
#this script will break if changes are made to the pagination system within: https://fitgirl-repacks.site/all-my-repacks-a-z
#depends:
apt-get install curl -y
apt-get install lynx -y
#{1..x} where x is the max page depth within pagination: https://fitgirl-repacks.site/all-my-repacks-a-z
for page in {1..61} 
do
#download source and run tests to turnicate:
  rm -rf test.html && rm -rf fitsource.txt && rm -rf test2.html
  curl -sS https://fitgirl-repacks.site/all-my-repacks-a-z/?lcp_page0=$page#lcp_instance_0 >> fitsource.txt && wait 
  sed -n "/entry-content\">/,/lcp_paginator/p" fitsource.txt >> test.html && sed 's/<\/a><\/li><\/ul><ul class=.*//g' test.html >> test2.html
#parse local html file with lynx:
  lynx -listonly -nonumbers --dump ~/test2.html > RepackList.txt
done
#cleanup:
rm -rf test.html && rm -rf fitsource.txt && rm -rf test2.html
