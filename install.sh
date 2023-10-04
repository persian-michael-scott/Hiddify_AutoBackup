#!/bin/bash

# Make this script executable
chmod +x "$0"

# Update package list and install Python
sudo apt update
sudo apt install -y python3

# Install pip (Python package manager)
sudo apt install -y python3-pip

# Install asyncio, requests, and python-telegram-bot packages
pip3 install asyncio requests python-telegram-bot

echo "Python and required packages installed successfully."

# Get the current directory
current_dir=$(pwd)

# Path to the Python script
script_path="$current_dir/backup_and_upload.sh"


# Prompt the user for the bot_token
echo "Create your bot using @Botfather in Telegram and Enter your bot token: "
read bot_token

# Prompt the user for the chat_id
echo "Take your Chat ID from @userinfobot and Enter your chat ID: "
read chat_id

# Specify the filename where you want to save the Python script
file_name="Setting.py"

# Write the inputs to the Python script file
echo "bot_token = '$bot_token'" > "$file_name"
echo "chat_id = '$chat_id'" >> "$file_name"

# Provide feedback to the user
echo "Inputs saved to $file_name"


# Add the cron job to run app.py every 3 hours
(crontab -l ; echo "0 */3 * * * /bin/bash $script_path") | crontab -

echo "Cron job added to run $script_path every 3 hours."

echo "Testing Backup Upload. Make sure you have Started conversation with bot in Telegram"

bash backup_and_upload.sh

echo "You should now see the backup file in telegram . it will be scheduled to send it every 3 hour"
