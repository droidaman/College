#!/bin/bash
LOGFILE=~/Desktop/Bench1_PhoneNumbers_Results.out

####################################
#
# Test Suite Script for
# CS380 Lab 3.
#
# Benchmark 1 - Phone Numbers
#
####################################

echo "Running benchmark 1: Procedural - ArrayList on 500 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_Procedural_AL 500_Phone_Numbers 724 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 1: Procedural - ArrayList on 5000 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_Procedural_AL 5000_Phone_Numbers 724 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 1: Procedural - ArrayList on 50000 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_Procedural_AL 50000_Phone_Numbers 724 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 1: Procedural - ArrayList on 1000000 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_Procedural_AL 1000000_Phone_Numbers 724 1 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE

echo "Running benchmark 1: Procedural - LinkedList on 500 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_Procedural_LL 500_Phone_Numbers 724 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 1: Procedural - LinkedList on 5000 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_Procedural_LL 5000_Phone_Numbers 724 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 1: Procedural - LinkedList on 50000 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_Procedural_LL 50000_Phone_Numbers 724 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 1: Procedural - LinkedList on 1000000 Phone Numbers" 2>&1 | tee -a $LOGFILE
#java B1_Procedural_LL 1000000_Phone_Numbers 724 1 2>&1 | tee -a $LOGFILE
echo "Test timed out after 2.5 hours." 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE

echo "Running benchmark 1: JoSQL - ArrayList on 500 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_JoSQL_AL 500_Phone_Numbers 724 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 1: JoSQL - ArrayList on 5000 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_JoSQL_AL 5000_Phone_Numbers 724 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 1: JoSQL - ArrayList on 50000 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_JoSQL_AL 50000_Phone_Numbers 724 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 1: JoSQL - ArrayList on 1000000 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_JoSQL_AL 1000000_Phone_Numbers 724 1 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE

echo "Running benchmark 1: JoSQL - LinkedList on 500 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_JoSQL_LL 500_Phone_Numbers 724 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 1: JoSQL - LinkedList on 5000 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_JoSQL_LL 5000_Phone_Numbers 724 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 1: JoSQL - LinkedList on 50000 Phone Numbers" 2>&1 | tee -a $LOGFILE
java B1_JoSQL_LL 50000_Phone_Numbers 724 5 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running benchmark 1: JoSQL - LinkedList on 1000000 Phone Numbers" 2>&1 | tee -a $LOGFILE
#java B1_JoSQL_LL 1000000_Phone_Numbers 724 1 2>&1 | tee -a $LOGFILE
echo "Test timed out after 2.5 hours." 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo
echo "Please wait..."
sleep 2s
