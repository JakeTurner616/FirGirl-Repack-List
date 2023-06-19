# Disclaimer

Despite my continued willingness to support the concept, this project has been neglected for a considerable duration. It is highly likely that most if not all users will find much greater utility in exploring [this repository](https://github.com/JakeTurner616/FitGirl-Magnet-List) for a simpler and more reliable web scraping and magnet link extraction method of https://fitgirl-repacks.site/all-my-repacks-a-z/.

# FitGirl-Repack-List

Unofficial FitGirl [(Updated) Repack List](https://files.serverboi.org/s/RepackList.txt) that refreshes every 24 hours / associated web-scrape scripts for  ![Repack List Updating](./RepackUpdater.sh) or ![Updating + Magnet](./script.sh) extraction:

# RepackUpdater.sh 
![RepackUpdater.sh](./RepackUpdater.sh) simply creates an updated `RepackList.txt` file and places it into the scripts' working directory. 

# script.sh 
`script.sh` is a web-scraper that has two purposes, and is divided into two parts:
1) creating an updated `RepackList.txt` with a consise list of FitGirl repacks.
2) reading the `RepackList.txt` and for each entry extract download mirrors into a consise `magnet.txt` in `~/links/fitgirl-repacks.site/<repackname>`.

# RepackUpdater.sh Limitations
- `RepackUpdater.sh` needs to be ran as a root/elevated user.

# script.sh Limitations
- `script.sh` takes a very long time to extract magnet links. It creates and filters through a list of nearly 3000 links, all need to be pulled from the source of a parent file, and searched through individually. 

- `script.sh` needs to be ran as a root/elevated user.



