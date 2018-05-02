#!/bin/bash
# A simple script to check each region for any snapshots that exist. 
# Takes in AWS account number as parameter $1
# you can run this command using a file for the parameters as follows: aws-describe-snapshots.sh $(cat aws-account-number.txt)
# some answers suggest you can enclose the cat command in single quotes which should pass each individual entry in the file as a parameter, or you can close in double quotes to pass the entire contents as a single parameter - although this may vary by distro.
# The cut command with -f3 returns only the third field of the output from the aws ec2 command

for region in `aws ec2 describe-regions --output text | cut -f3`
do
     echo -e "\nListing snapshots in region:'$region'..."
     aws ec2 describe-snapshots --owner-ids $1 --region $region
done