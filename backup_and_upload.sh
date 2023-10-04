cd /opt/hiddify-config/hiddify-panel
python3 -m hiddifypanel backup

backup_directory="/opt/hiddify-config/hiddify-panel/backup"

# Check if the directory exists
if [ -d "$backup_directory" ]; then
    # Get the most recently created file in the directory
    latest_file=$(ls -t1 "$backup_directory" | head -n 1)
    
    # Check if a file was found
    if [ -n "$latest_file" ]; then
        echo "Latest created file: $backup_directory/$latest_file"
        
        # Now you can use "$directory/$latest_file" in your script as needed.
    else
        echo "No files found in the directory."
    fi
else
    echo "Directory not found: $backup_directory"
fi

latest_backup="$backup_directory/$latest_file"


python3 /opt/Hiddify_AutoBackup/app.py "$latest_backup"