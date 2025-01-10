MEMO - Advanced Backup and Data Retrieval Tool 🛠️
Welcome to MEMO, the updated and more powerful version of my USB hacking tool! This tool is designed for educational purposes and provides advanced features for backing up files, retrieving Wi-Fi passwords, and encrypting data. It’s a significant upgrade from the previous version, with enhanced functionality and security.

Features ✨
Backup Files: Automatically backs up:

Pictures

Favorites

Videos

Desktop

Documents

AppData

Retrieve Wi-Fi Passwords: Extracts saved Wi-Fi passwords and saves them to a file.

Encrypt Backup: Secures your backup with a password-protected ZIP file.

Password Protection: Ensures only authorized users can run the script.

Disk Space Check: Verifies there’s enough space on the destination drive before starting the backup.

Logging: Logs all actions for future reference.

Cool Hacking-Style Design: Includes green and red text for a professional and fun look.

How to Use 🚀
Download the Script:

Clone this repository or download the MEMO.bat file.

Run the Script:

Double-click the MEMO.bat file to run it.

Enter the Password:

When prompted, enter the password to proceed.

Note: The password is not memo or YourSecurePassword. Make sure to set your own secure password in the script.

Backup Process:

The script will:

Backup your files to a timestamped folder.

Retrieve Wi-Fi passwords and save them to a file.

Encrypt the backup using 7z.

Completion:

Once the process is complete, you’ll see a message confirming the backup and the location of the encrypted ZIP file.

Requirements 📋
Windows 10 or Later: The script uses ANSI escape codes for colored text, which are only supported in Windows 10 and later.

7-Zip: Ensure 7z is installed and accessible in your system's PATH for the encryption step.

Customization 🛠️
Set Your Password:

Open the MEMO.bat file in a text editor.

Replace YourSecurePassword with your desired password.

batch
Copy
set "password=YourSecurePassword"
Important: Do not use memo or YourSecurePassword as your actual password.

Change Backup Drive:

Modify the odrive variable to specify the destination drive for the backup.

batch
Copy
SET odrive=D:
Disclaimer ⚠️
This tool is intended for educational purposes only. Use it responsibly and only on systems you own or have permission to access. The author is not responsible for any misuse of this tool.

Support 💬
If you have any questions or need assistance, feel free to open an issue or contact me directly.

Enjoy using MEMO! 🎉

Preview of the README on GitHub:
MEMO Preview
