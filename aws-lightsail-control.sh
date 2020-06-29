#!/bin/bash
a="LAMP_PHP_7-1"
sleep_time=20

echo "retrieving the state of instance $a"
aws lightsail get-instance-state --instance-name $a
echo "would you like to start/stop your instance ($a)? (start/1 OR stop/2 OR neither/3)"
read startstopInstance #allows you to take in user input
echo $startstopInstance


if [ "$startstopInstance" = "start" ] || [ "$startstopInstance" = "1" ]; then
	echo "starting your instance now..."
	aws lightsail start-instance --instance-name $a
	aws lightsail get-instance --instance-name $a | grep "publicIpAddress"
	sleep_time=20
	echo "sleeping for $sleep_time seconds before we check instance state again..."
	aws lightsail get-instance-state --instance-name $a

elif [ "$startstopInstance" = "stop" ] || [ "$startstopInstance" = "2" ]; then
	echo "stopping your instance now..."
	aws lightsail stop-instance --instance-name $a
	sleep_time=20
	echo "sleeping for $sleep_time seconds before we check instance state again..."
	aws lightsail get-instance-state --instance-name $a
fi