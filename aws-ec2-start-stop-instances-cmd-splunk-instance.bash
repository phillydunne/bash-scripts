#!/bin/bash
# A simple script to allow you to start or stop a single aws ec2 instance
# The instance id is set in this script
#set -x
a="i-04a8ca03ae20cbab3" #when assigning variables do not include the $
aws ec2 describe-instances --instance-ids $a | grep "state" 
#there is a --filters open which has an instance state filter, however i dont think this can be used wth the --instance-ids option

echo "would you like to start your Splunk instance ($a)? (start/1 OR stop/2 OR neither/3)"
read startstopInstance #allows you to take in user input
#echo $startstopInstance


if [ "$startstopInstance" = "start" ] || [ "$startstopInstance" = "1" ]; then
	aws ec2 start-instances --instance-ids $a
	aws ec2 describe-instances --instance-ids $a | grep "PublicDnsName"

elif [ "$startstopInstance" = "stop" ] || [ "$startstopInstance" = "2" ]; then
	aws ec2 stop-instances --instance-ids $a

fi

$SHELL