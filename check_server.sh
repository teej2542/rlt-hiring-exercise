#!/usr/bin/env bash

IP_ADDRESS=$(aws ec2 describe-instances --profile as --filters "Name=tag:name,Values=test_nginx" --query 'Reservations[*].[Instances[0].PublicIpAddress]' --output text)
STATE=$(aws ec2 describe-instances --profile as --filters "Name=tag:name,Values=test_nginx" --query 'Reservations[*].[Instances[0].State.Name]' --output text)
VERSION="1.0.6"

echo "Server status is: $STATE"

FILE_CHECK=$(curl http://$IP_ADDRESS/version.txt)

#echo $FILE_CHECK

if [ $FILE_CHECK == "1.0.6" ]; then
    echo "Version.txt is up and running!"
else
    echo "Page is down!"
fi