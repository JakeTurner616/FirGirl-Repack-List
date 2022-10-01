#!/bin/bash
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
  lynx -listonly -nonumbers --dump ~/test2.html >> RepackList.txt
done
#cleanup:
rm -rf test.html && rm -rf fitsource.txt && rm -rf test2.html
#write out Download Mirror list to ~/links/fitgirl-repacks.site
rm -rf ~/links/fitgirl-repacks.site
touch ~/magnet.txt
file=$(cat RepackList.txt)
for line in $file
do
    pagename=$(cat RepackList.txt | sed -r 's/^.{29}//')
    curl -sS "$line" > pagesource.txt
    file=$(echo "$line" |sed 's/https\?:\/\///') 
    mkdir -p ~/links/"$file" && touch ~/links/"$file"magnet.html
    sed -n "/<h3>Download Mirrors<\/h3>/,/<h3>Screenshots (Click to enlarge)<\/h3>/p" pagesource.txt > ~/links/"$file"magnet.html
    echo $(lynx -listonly -nonumbers --dump ~/links/"$file"magnet.html) > ~/links/"$file"magnet.html
    touch ~/links/"$file"magnet.txt 
    mv ~/links/"$file"magnet.html ~/links/"$file"magnet.txt
    sed 's/ /\n/g' ~/links/"$file"magnet.txt > ~/links/"$file"magnet0.txt
    rm -rf sed 's/ /\n/g' ~/links/"$file"magnet.txt
    mv ~/links/"$file"magnet0.txt ~/links/"$file"magnet.txt
    rm -rf sed 's/ /\n/g' ~/links/"$file"magnet0.txt
    sudo chown -R $(whoami) ~/links
done
#cleanup
rm -rf pagesource.txt
rm -rf magnet.txt
