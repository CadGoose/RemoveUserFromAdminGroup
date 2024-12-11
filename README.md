# RemoveUserFromAdminGroup

A script to remove a local user from the administrators group, ensuring it runs with administrator privileges.

## Description

This script is designed to remove a specified local user from the administrators group on a Windows machine. It ensures that the script runs with administrator privileges.

## Prerequisites

- Windows operating system
- Administrator credentials

## Usage

## 1. **Clone the Repository**:
   
   git clone https://github.com/YOUR_USERNAME/RemoveUserFromAdminGroup.git
   cd RemoveUserFromAdminGroup

## 2. Edit the Script:
- Open RemoveUserFromAdminGroup.au3 in a text editor.
- Replace ADMIN USER NAME and ADMIN PASSWORD with the actual administrator username and password.

## 3.Run the Script:
- Execute the script using an AutoIt interpreter or compile it to an executable.


# Script Details
The script performs the following steps:

## 1. Check for Administrator Privileges:
If the script is not running as an administrator, it displays an error message and exits.

## 2. Prompt for User Account:
Prompts the user to enter the username of the account to be removed from the administrators group.

## 3. Remove User from Administrators Group:
Uses the net localgroup command to remove the specified user from the local administrators group.

## 4. Confirm Success:
Displays a message indicating whether the user was successfully removed from the administrators group.

## 5. Optional Restart:
Prompts the user to restart the computer immediately or later.
