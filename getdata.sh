#!/usr/bin/env bash

IP_ADDRESS=$(aws ec2 describe-instances --profile as --filters "Name=tag:name,Values=test_nginx" --query 'Reservations[*].[Instances[0].PublicIpAddress]' --output text)
echo "IP: ${IP_ADDRESS}"

URL="http://${IP_ADDRESS}/version.txt"
echo "URL to check file: ${URL}"