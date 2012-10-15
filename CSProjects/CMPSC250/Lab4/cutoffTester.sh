#!/bin/bash

# Braden Licastro
# CS250
# Lab 4
#
# Running this file will test intervals of cutoff
# values to find when it is beneficial to switch algorithms.
#
# NOTE!
# The *Lim.class files are the same as the originals but with
# limited output to insure readability of the tests run in this script.

clear

echo "Current working directory: "
pwd
echo

read -p "Number of times to increment values and run script? " runTime
echo

echo "Parameter input for sorting algorithms:"
read -p "What is the starting size of the array? " arrSize
read -p "Increment array size by how much with each test? " arrInc
read -p "How many experiments to be averaged by the sorting algorithms? " expNum
read -p "What is the starting cutoff value? " cutSize
read -p "Increment cutoff by how much with each test? " cutInc
echo

for ((n=0;n<$runTime;n++))
    do
        echo "QuickIns `java QuickInsLim $arrSize $expNum $cutSize`"
        echo "QuickNoIns `java QuickNoInsLim $arrSize $expNum`"
        echo "ArraySize: $arrSize  Cutoff: $cutSize"
        echo
        arrSize=`expr $[arrSize + arrInc]`
        cutSize=`expr $[cutSize + cutInc]`
    done
