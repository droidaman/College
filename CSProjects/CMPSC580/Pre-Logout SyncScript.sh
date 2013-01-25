#!/bin/bash
LOGFILE=~/College/CSProjects/CMPSC580/syncStatus.log

####################################
#
# Data sync script for the
# CS580 repository.
#
####################################

# Print start status message.
echo "-------------------------------------------------" >> $LOGFILE
echo >> $LOGFILE
echo "$(date) - Syncing files from Bitbucket into GitHub" >> $LOGFILE
echo >> $LOGFILE

# Sync content between GitHub and Bitbucket repos.
rsync -av --exclude-from '../College/CSProjects/CMPSC580/syncExclude.txt' ~/Desktop/CS580/ ~/College/CSProjects/CMPSC580/ >> $LOGFILE

# Print end status message.
echo >> $LOGFILE
echo "$(date) - Backup complete!" >> $LOGFILE
echo >> $LOGFILE
