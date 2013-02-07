#!/bin/bash
LOGFILE=~/College/CSProjects/CMPSC580/syncStatus.log

####################################
#
# Data sync script for the
# CS580 Local
# and College repositories.
#
# Version: 3.0.1.15 Build: 20130207
#
####################################

### Set up function declarations before they are used ###
function syncCollegeGit {
	# Add files to commit
	echo 2>&1 | tee -a $LOGFILE
    echo "$(date) - Adding files to be committed to the College repo." 2>&1 | tee -a $LOGFILE
    cd ~/College && git add . 2>&1 | tee -a $LOGFILE

    # Accept commit message and commit changes
    echo 2>&1 | tee -a $LOGFILE
    echo "Enter a commit message."
    read commitMSG
    echo "$(date) - Commiting changes." 2>&1 | tee -a $LOGFILE
    cd ~/College && git commit -m "$commitMSG" . 2>&1 | tee -a $LOGFILE

    # Push changes to the repository
    echo 2>&1 | tee -a $LOGFILE
    echo "$(date) - Pushing changes." 2>&1 | tee -a $LOGFILE
    cd ~/College && git push 2>&1 | tee -a $LOGFILE
}


### Run the script ###

# Local folder sync initilized.
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE

# Pull repo from GitHub before checking status.
echo 2>&1 | tee -a $LOGFILE
echo "$(date) - Pulling College repo before folder sync." 2>&1 | tee -a $LOGFILE
cd ~/College && git pull 2>&1 | tee -a $LOGFILE

# Sync content between GitHub and Bitbucket repos.
echo 2>&1 | tee -a $LOGFILE
echo "$(date) - Syncing local Bitbucket and GitHub repos." 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Sending data" 2>&1 | tee -a $LOGFILE
rsync -auv --exclude-from '../College/CSProjects/CMPSC580/syncExclude.txt' ~/Desktop/CS580/ ~/College/CSProjects/CMPSC580/ 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Receiving data" 2>&1 | tee -a $LOGFILE
rsync -auv --exclude-from '../College/CSProjects/CMPSC580/syncExclude.txt' ~/College/CSProjects/CMPSC580/ ~/Desktop/CS580/ 2>&1 | tee -a $LOGFILE

# Local sync complete.
echo 2>&1 | tee -a $LOGFILE
echo "$(date) - Local sync complete!" 2>&1 | tee -a $LOGFILE

# Print start status message.
echo 2>&1 | tee -a $LOGFILE
echo "$(date) - Retrieving College repo status." 2>&1 | tee -a $LOGFILE
cd ~/College && git status 2>&1 | tee -a $LOGFILE

# See if we want to autosync with the script
echo 2>&1 | tee -a $LOGFILE
echo "Would you like to autocommit and push the College repo?" 2>&1 | tee -a $LOGFILE
select yn in "Yes" "No"; do
    case $yn in
        Yes)
            syncCollegeGit
            echo 2>&1 | tee -a $LOGFILE
            echo 2>&1 | tee -a $LOGFILE
            echo "Sync complete." 2>&1 | tee -a $LOGFILE
            echo 2>&1 | tee -a $LOGFILE
            break
            ;;
        No)
            echo 2>&1 | tee -a $LOGFILE
            echo 2>&1 | tee -a $LOGFILE
            echo "** Sync cancelled. Please manually update College repository." 2>&1 | tee -a $LOGFILE
            echo 2>&1 | tee -a $LOGFILE
            break
            ;;
    esac
done

# Log out?
echo
echo "Would you like to log out?"
select lo in "Yes" "No"; do
    case $lo in
        Yes)
            gnome-session-quit --no-prompt
            break
            ;;
        No)
            break
            ;;
    esac
done

echo
echo "Please wait..."
sleep 1s
