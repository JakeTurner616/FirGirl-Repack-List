#!/bin/bash
mkdir $(pwd)/links 
apt-get install lynx -y
for page in {1..61} 
do
  rm -rf test.html && rm -rf fitsource.txt && rm -rf test2.html
  curl -sS https://fitgirl-repacks.site/all-my-repacks-a-z/?lcp_page0=$page#lcp_instance_0 >> fitsource.txt && wait 
  sed -n "/entry-content\">/,/lcp_paginator/p" fitsource.txt >> test.html && sed 's/<\/a><\/li><\/ul><ul class=.*//g' test.html >> test2.html
  lynx -listonly -nonumbers --dump ~/test2.html >> RepackList.txt
done
