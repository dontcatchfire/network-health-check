#!/bin/bash

# Network Health Check 

echo "Network Health Check..."

# 1. Display Server Information 

hostname=$(hostname)
currentUser=$(whoami)
date=$(date)

echo "Server Information >>"
echo "Hostname: $hostname"
echo "Current user: $currentUser"
echo "Date and Time: $date"

echo -e "\n"
echo "-----------------------------------"

# 2. Display Network Information

ip=$(hostname -I)
gateway=$(ip route) 
dns=$(resolvectl status)


echo "Network Information >>"
echo "IP Address: $ip"
echo "Default Gateway: $gateway"
echo "DNS Server: $dns"


echo "-----------------------------------"
echo -e "\n"

# 3. Check Internet Connectivity

echo "Checking Internet connectivity..."

ping -c 1 8.8.8.8
sleep 1

if [ $? -eq 0 ];then
	echo "Internet connectivity: UP"
else
	echo "Internet connectivity: DOWN"
fi


echo "----------------------------------"
echo -e "\n"

# 4. Check DNS Resolution

echo "Checking DNS Resolution..."

dig google.com

if [ $? -eq 0 ]; then
	echo "DNS Resolution: WORKING"
else
	echo "DNS Resolution: FAILED"
fi


echo "----------------------------------"
echo -e "\n"

# 5. Check Website Availability

echo "Checking if google.com, github.com and amazon.com are available..."

for website in google.com github.com amazon.com
do
	ping -c 1 $website
	#captures the output of 'ping' and stores in in 'status'
	status=$?

	if [ $status -eq 0 ]; then
		echo ">> $website is UP"
	else
		echo ">> $website is DOWN"
	fi
done



