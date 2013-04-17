#!/bin/bash
LOGFILE=~/Desktop/SerializationBench.out

####################################
#
# Braden Licastro
#
# Test Suite Script for
# CS380 Lab 6.
#
# XML and Binary Serialization Benchmark
#
####################################

echo "Running iteration 1 - Tree Size 10" 2>&1 | tee -a $LOGFILE
java TreeAlgorithms 10 bin/out10.bin xml/out10.xml --q 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running iteration 2 - Tree Size 10" 2>&1 | tee -a $LOGFILE
java TreeAlgorithms 10 bin/out10.bin xml/out10.xml --q 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running iteration 3 - Tree Size 10" 2>&1 | tee -a $LOGFILE
java TreeAlgorithms 10 bin/out10.bin xml/out10.xml --q 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running iteration 4 - Tree Size 10" 2>&1 | tee -a $LOGFILE
java TreeAlgorithms 10 bin/out10.bin xml/out10.xml --q 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running iteration 5 - Tree Size 10" 2>&1 | tee -a $LOGFILE
java TreeAlgorithms 10 bin/out10.bin xml/out10.xml --q 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo
echo
echo
echo "Running iteration 1 - Tree Size 100" 2>&1 | tee -a $LOGFILE
java TreeAlgorithms 100 bin/out100.bin xml/out100.xml --q 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running iteration 2 - Tree Size 100" 2>&1 | tee -a $LOGFILE
java TreeAlgorithms 100 bin/out100.bin xml/out100.xml --q 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running iteration 3 - Tree Size 100" 2>&1 | tee -a $LOGFILE
java TreeAlgorithms 100 bin/out100.bin xml/out100.xml --q 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running iteration 4 - Tree Size 100" 2>&1 | tee -a $LOGFILE
java TreeAlgorithms 100 bin/out100.bin xml/out100.xml --q 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo 2>&1 | tee -a $LOGFILE
echo "Running iteration 5 - Tree Size 100" 2>&1 | tee -a $LOGFILE
java TreeAlgorithms 100 bin/out100.bin xml/out100.xml --q 2>&1 | tee -a $LOGFILE
echo "------------------------------------------------------------" 2>&1 | tee -a $LOGFILE
echo
echo "Please wait..."
sleep 2s
