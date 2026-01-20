#!/bin/sh
wget http://spatialkeydocs.s3.amazonaws.com/FL_insurance_sample.csv.zip
ls
unzip FL_insurance_sample.csv.zip
rm -rf __MACOSX && rm -f FL_insurance_sample.csv.zip
ls -al --block-size=MB FL_insurance_sample.csv
head -5 FL_insurance_sample.csv
wc -l FL_insurance_sample.csv
dos2unix --mac2unix FL_insurance_sample.csv
head -5 FL_insurance_sample.csv
wc -l FL_insurance_sample.csv
