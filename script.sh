#!/bin/bash
mkdir $(pwd)/links &>/dev/null & rm -rf -f -- $(pwd)/links/links.txt &>/dev/null
apt-get install lynx -y
spinner()
{
    local pid=$!
    local delay=1
    local spinstr='|/\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}
for page in {1..61} 
do
  (rm -rf test.html &>/dev/null && rm -rf fitsource.txt &>/dev/null && rm -rf test2.html &>/dev/null && curl -sS https://fitgirl-repacks.site/all-my-repacks-a-z/?lcp_page0=$page#lcp_instance_0 >> fitsource.txt && wait && sed -n "/entry-content\">/,/lcp_paginator/p" fitsource.txt >> test.html && sed 's/<\/a><\/li><\/ul><ul class=.*//g' test.html >> test2.html && lynx -listonly -nonumbers --dump /home/jake/test2.html >> $(pwd)/links/links.txt && sort $(pwd)/links/links.txt >> $(pwd)/links/links.txt)& 
spinner
done
