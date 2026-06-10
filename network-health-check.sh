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

echo -e "\n"
echo "-----------------------------------"

# 3. Check Internet Connectivity

echo "Checking Internet connectivity..."

ping -c 1 8.8.8.8
sleep 1

if [ $? -eq 0 ];then
	echo "Internet connectivity: UP"
else
	echo "Internet connectivity: DOWN"
fi

echo -e "\n"
echo "----------------------------------"

# 4. Check DNS Resolution




