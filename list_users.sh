#!/bin/bash
echo "Active Users:"
az ad user list --query "[?accountEnabled==true].{Name:displayName, userPrincipalName:userPrincipalName}" -o table
