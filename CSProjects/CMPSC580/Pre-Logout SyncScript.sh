#!/bin/bash
LOGFILE=~/College/CSProjects/CMPSC580/syncStatus.log

####################################
#
# Data sync script for the
# CS580 and College repositories.
#
####################################

### Set up function declarations before they are used ###

function syncGit {
    # Add files to commit
    echo 2>&1 | tee -a $LOGFILE
    echo "$(date) - Adding files to be committed." 2>&1 | tee -a $LOGFILE
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
echo 2>&1 | tee -a $LOGFILE
echo "$(date) - Syncing local Bitbucket and GitHub repos." 2>&1 | tee -a $LOGFILE

# Sync content between GitHub and Bitbucket repos.
rsync -av --exclude-from '../College/CSProjects/CMPSC580/syncExclude.txt' ~/Desktop/CS580/ ~/College/CSProjects/CMPSC580/ 2>&1 | tee -a $LOGFILE

# Local sync complete.
echo 2>&1 | tee -a $LOGFILE
echo "$(date) - Local sync complete!" 2>&1 | tee -a $LOGFILE


# Pull repo from GitHub before checking status.
echo 2>&1 | tee -a $LOGFILE
echo "$(date) - Pulling repos before status check." 2>&1 | tee -a $LOGFILE
cd ~/College && git pull 2>&1 | tee -a $LOGFILE

# Print start status message.
echo 2>&1 | tee -a $LOGFILE
echo "$(date) - Retrieving repo status." 2>&1 | tee -a $LOGFILE
cd ~/College && git status 2>&1 | tee -a $LOGFILE

# See if we want to autosync with the script
echo 2>&1 | tee -a $LOGFILE
echo "Would you like to autocommit and push the repo?" 2>&1 | tee -a $LOGFILE
select yn in "Yes" "No"; do
    case $yn in
        Yes)
            syncGit
            echo 2>&1 | tee -a $LOGFILE
            echo 2>&1 | tee -a $LOGFILE
            echo "Sync complete." 2>&1 | tee -a $LOGFILE
            echo 2>&1 | tee -a $LOGFILE
            break
            ;;
        No)
            echo 2>&1 | tee -a $LOGFILE
            echo 2>&1 | tee -a $LOGFILE
            echo "** Sync cancelled. Please manually update repository." 2>&1 | tee -a $LOGFILE
            echo 2>&1 | tee -a $LOGFILE
            break
            ;;
    esac
done

# Log out?
echo 2>&1 | tee -a $LOGFILE
echo "Would you like to log out?" 2>&1 | tee -a $LOGFILE
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

sleep 5s
