# FitGirl-Repack-List
 Unofficial FitGirl ![Repack List](./RepackList.txt) and associated web-scrape script.

# RepackUpdater.sh 
RepackUpdater.sh simply creates an updated `RepackList.txt` file and places it into the scripts' working directory. 

# script.sh 
script.sh is a web-scraper that has two purposes, and is divided into two parts:
1. creating an updated `RepackList.txt` with a consise list of FitGirl repacks.
2. reading the `RepackList.txt` and for each entry extract download mirrors into a consise `magnet.txt` in `~/links/fitgirl-repacks.site/<repackname>`.

# script.sh Limitations
script.sh takes a long time. It creates and filters through a list of nearly 3000 links, all need to be pulled from the source of a parent file, and searched through individually. 
script.sh needs to be ran as a root/elevated user.

# RepackUpdater.sh Limitations
RepackUpdater.sh needs to be ran as a root/elevated user.


