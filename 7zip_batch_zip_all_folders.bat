@echo off
setlocal enabledelayedexpansion

:: Set ANSI codes for coloring
set COLOR_RESET=\033[0m
set COLOR_RED=\033[31m
set COLOR_GREEN=\033[32m
set COLOR_YELLOW=\033[33m
set COLOR_BLUE=\033[34m

:: Path to 7z.exe
set "SEVENZIP_PATH=C:\Program Files\7-Zip\7z.exe"

:: Log file path
set "LOG_FILE=7zip_batch_zip_all_folders.log"

:: Directory containing folders to zip
set "SOURCE_DIR=."

:: Default compression level
set "COMPRESSION_LEVEL=5"

:: Output directory
set "OUTPUT_DIR=%SOURCE_DIR%"

:: Exclude pattern
set "EXCLUDE_PATTERN="

:menu
cls
echo %COLOR_BLUE%=============
echo %COLOR_BLUE%= 7-Zip Batch Zipper - Advanced Options Batch Script        =
echo %COLOR_BLUE%=============
echo %COLOR_RESET%
echo %COLOR_GREEN%Select an option:
echo %COLOR_RESET%
echo 1. %COLOR_YELLOW%Zip all folders in the current directory
echo 2. %COLOR_YELLOW%Set the 7-Zip executable path
echo 3. %COLOR_YELLOW%Set the source directory
echo 4. %COLOR_YELLOW%Set the output directory
echo 5. %COLOR_YELLOW%Set compression level (1-9)
echo 6. %COLOR_YELLOW%Exclude specific folder(s) by name
echo 7. %COLOR_YELLOW%Clear log
echo 8. %COLOR_YELLOW%About
echo 9. %COLOR_YELLOW%Exit
echo %COLOR_RESET%
set /p choice= Enter your choice: 

if /i "%choice%"=="1" goto zip_folders
if /i "%choice%"=="2" goto set_7zip_path
if /i "%choice%"=="3" goto set_source_dir
if /i "%choice%"=="4" goto set_output_dir
if /i "%choice%"=="5" goto set_compression_level
if /i "%choice%"=="6" goto set_exclude_pattern
if /i "%choice%"=="7" goto clear_log
if /i "%choice%"=="8" goto about
if /i "%choice%"=="9" goto end

echo %COLOR_RED%Invalid choice. Please try again.%COLOR_RESET%
pause
goto menu

:zip_folders
cls
echo %COLOR_BLUE%=============
echo %COLOR_BLUE%= Zipping Folders =
echo %COLOR_BLUE%=============
echo %COLOR_RESET%

:: Check if 7z.exe exists
if not exist "%SEVENZIP_PATH%" (
    echo %COLOR_RED%Error: 7z.exe not found at %SEVENZIP_PATH%. Please verify the path.%COLOR_RESET%
    pause
    goto menu
)

:: Check if source directory exists
if not exist "%SOURCE_DIR%" (
    echo %COLOR_RED%Error: Source directory not found at %SOURCE_DIR%. Please verify the path.%COLOR_RESET%
    pause
    goto menu
)

:: Check if output directory exists
if not exist "%OUTPUT_DIR%" (
    echo %COLOR_RED%Error: Output directory not found at %OUTPUT_DIR%. Please verify the path.%COLOR_RESET%
    pause
    goto menu
)

echo %COLOR_WHITE%Zipping folders in %SOURCE_DIR% to %OUTPUT_DIR% with compression level %COMPRESSION_LEVEL%.%COLOR_RESET%
echo %COLOR_WHITE%Excluding folders matching pattern: %EXCLUDE_PATTERN%%COLOR_RESET%

for /D %%i in ("%SOURCE_DIR%\*") do (
    set "folder_name=%%~ni"
    set "folder_path=%%~fi"
    if "!folder_name!"=="!folder_name:%EXCLUDE_PATTERN%=!" (
        echo %COLOR_GREEN%Zipping !folder_name!...
        "%SEVENZIP_PATH%" a -tzip "!OUTPUT_DIR!\!folder_name!.zip" "!folder_path!\*" -mx%COMPRESSION_LEVEL% >> "%LOG_FILE%" 2>&1
        if !errorlevel! neq 0 (
            echo %COLOR_RED%Error zipping !folder_name!. Check log file for details.%COLOR_RESET%
        ) else (
            echo %COLOR_GREEN%Successful!%COLOR_RESET%
        )
    ) else (
        echo %COLOR_YELLOW%Skipping !folder_name! (matches exclude pattern)%COLOR_RESET%
    )
)

echo %COLOR_GREEN%All folders have been processed.%COLOR_RESET%
pause
goto menu

:set_7zip_path
cls
echo %COLOR_BLUE%=============
echo %COLOR_BLUE%= Set 7-Zip Executable Path =
echo %COLOR_BLUE%=============
echo %COLOR_RESET%
set /p SEVENZIP_PATH=Enter the path to 7z.exe (current: %SEVENZIP_PATH%): 
echo %COLOR_GREEN%7-Zip path set to %SEVENZIP_PATH%.%COLOR_RESET%
pause
goto menu

:set_source_dir
cls
echo %COLOR_BLUE%=============
echo %COLOR_BLUE%= Set Source Directory =
echo %COLOR_BLUE%=============
echo %COLOR_RESET%
set /p SOURCE_DIR=Enter the path to the source directory (current: %SOURCE_DIR%): 
echo %COLOR_GREEN%Source directory set to %SOURCE_DIR%.%COLOR_RESET%
pause
goto menu

:set_output_dir
cls
echo %COLOR_BLUE%=============
echo %COLOR_BLUE%= Set Output Directory =
echo %COLOR_BLUE%=============
echo %COLOR_RESET%
set /p OUTPUT_DIR=Enter the path to the output directory (current: %OUTPUT_DIR%): 
echo %COLOR_GREEN%Output directory set to %OUTPUT_DIR%.%COLOR_RESET%
pause
goto menu

:set_compression_level
cls
echo %COLOR_BLUE%=============
echo %COLOR_BLUE%= Set Compression Level =
echo %COLOR_BLUE%=============
echo %COLOR_RESET%
set /p COMPRESSION_LEVEL=Enter the compression level (1-9) (current: %COMPRESSION_LEVEL%): 
if %COMPRESSION_LEVEL% lss 1 set COMPRESSION_LEVEL=1
if %COMPRESSION_LEVEL% gtr 9 set COMPRESSION_LEVEL=9
echo %COLOR_GREEN%Compression level set to %COMPRESSION_LEVEL%.%COLOR_RESET%
pause
goto menu

:set_exclude_pattern
cls
echo %COLOR_BLUE%=============
echo %COLOR_BLUE%= Set Exclude Pattern =
echo %COLOR_BLUE%=============
echo %COLOR_RESET%
set /p EXCLUDE_PATTERN=Enter the pattern of folders to exclude (current: %EXCLUDE_PATTERN%): 
echo %COLOR_GREEN%Exclude pattern set to %EXCLUDE_PATTERN%.%COLOR_RESET%
pause
goto menu

:clear_log
cls
echo %COLOR_BLUE%=============
echo %COLOR_BLUE%= Clear Log File =
echo %COLOR_BLUE%=============
echo %COLOR_RESET%
if exist "%LOG_FILE%" (
    >nul 2>&1 del "%LOG_FILE%"
    echo %COLOR_GREEN%Log file cleared.%COLOR_RESET%
) else (
    echo %COLOR_RED%Log file does not exist.%COLOR_RESET%
)
pause
goto menu

:about
cls
echo %COLOR_BLUE%=============
echo %COLOR_BLUE%= About =
echo %COLOR_BLUE%=============
echo %COLOR_RESET%
echo This script zips all folders in a given directory into individual ZIP files.
echo It features a menu interface, color coding, and advanced options.
echo Author: Qwen (Alibaba Cloud)
echo Version: 1.0
echo Contact: ai.qwen@alibaba.com
echo %COLOR_BLUE%=============
echo %COLOR_RESET%
pause
goto menu

:end
echo %COLOR_GREEN%Thanks for using 7-Zip Batch Zipper. Goodbye!%COLOR_RESET%
endlocal