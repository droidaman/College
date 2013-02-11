#!/bin/bash
LOGFILE=~/Desktop/Bench2_FirstNames_Results.out

####################################
#
# Test Suite Script for
# CS380 Lab 3.
#
# Benchmark 2 - First Names
#
####################################

echo "Running benchmark 2: Procedural - ArrayList on 500 First Names" 2>&1 | tee -a $LOGFILE
java B2_Procedural_AL 500_Full_Names Greg 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 2: Procedural - ArrayList on 5000 First Names" 2>&1 | tee -a $LOGFILE
java B2_Procedural_AL 5000_Full_Names Greg 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 2: Procedural - ArrayList on 50000 First Names" 2>&1 | tee -a $LOGFILE
java B2_Procedural_AL 50000_Full_Names Greg 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 2: Procedural - ArrayList on 1000000 First Names" 2>&1 | tee -a $LOGFILE
java B2_Procedural_AL 1000000_Full_Names Greg 1 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE

echo "Running benchmark 2: Procedural - LinkedList on 500 First Names" 2>&1 | tee -a $LOGFILE
java B2_Procedural_LL 500_Full_Names Greg 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 2: Procedural - LinkedList on 5000 First Names" 2>&1 | tee -a $LOGFILE
java B2_Procedural_LL 5000_Full_Names Greg 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 2: Procedural - LinkedList on 50000 First Names" 2>&1 | tee -a $LOGFILE
java B2_Procedural_LL 50000_Full_Names Greg 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 2: Procedural - LinkedList on 1000000 First Names" 2>&1 | tee -a $LOGFILE
#java B2_Procedural_LL 1000000_Full_Names Greg 1 2>&1 | tee -a $LOGFILE
echo "Test timed out after 2.5 hours." 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE

echo "Running benchmark 2: JoSQL - ArrayList on 500 First Names" 2>&1 | tee -a $LOGFILE
java B2_JoSql_AL 500_Full_Names Greg 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 2: JoSQL - ArrayList on 5000 First Names" 2>&1 | tee -a $LOGFILE
java B2_JoSql_AL 5000_Full_Names Greg 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 2: JoSQL - ArrayList on 50000 First Names" 2>&1 | tee -a $LOGFILE
java B2_JoSql_AL 50000_Full_Names Greg 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 2: JoSQL - ArrayList on 1000000 First Names" 2>&1 | tee -a $LOGFILE
java B2_JoSql_AL 1000000_Full_Names Greg 1 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE

echo "Running benchmark 2: JoSQL - LinkedList on 500 First Names" 2>&1 | tee -a $LOGFILE
java B2_JoSql_LL 500_Full_Names Greg 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 2: JoSQL - LinkedList on 5000 First Names" 2>&1 | tee -a $LOGFILE
java B2_JoSql_LL 5000_Full_Names Greg 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 2: JoSQL - LinkedList on 50000 First Names" 2>&1 | tee -a $LOGFILE
java B2_JoSql_LL 50000_Full_Names Greg 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 2: JoSQL - LinkedList on 1000000 First Names" 2>&1 | tee -a $LOGFILE
#java B2_JoSql_LL 1000000_Full_Names Greg 1 2>&1 | tee -a $LOGFILE
echo "Test timed out after 2.5 hours." 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo
echo "Please wait..."
sleep 2s
