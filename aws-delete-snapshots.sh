#!/bin/bash
# A simple script to delete snapshots - should feed in variables in future. 
# Takes in snapshot-id as parameter 1 and region as parameter 2.
aws ec2 delete-snapshot --snapshot-id $1 --region $2