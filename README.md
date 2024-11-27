# 7-Zip Batch Zipper - Advanced Options Batch Script

This .bat file is a batch script designed to compress all folders in a specified directory into individual ZIP files using the 7-Zip command-line utility. The script features a menu interface, color coding, advanced options, and extensive error handling.

## Features:
- **Menu Interface**: Provides a user-friendly menu for selecting actions.
- **Color Coding**: Enhances readability by using ANSI escape codes for color.
- **Advanced Options**: Allows users to set the 7-Zip path, source directory, output directory, compression level, and exclude specific folders.
- **Error Handling**: Checks for missing files and directories and provides meaningful error messages.
- **Logging**: Writes logs to a file for tracking purposes.

## How to Use:

1. **Install 7-Zip**: Ensure that [7zip](https://www.7-zip.org/download.html) is installed on your system.
2. **Save the Script**: Save the script as `7zip_batch_zip_all_folders.bat`.
3. **Run the Script**: Double-click the .bat file or run it from the command prompt.

## Detailed Menu Options:

1. **Zip all folders in the current directory**
   - Compresses all subfolders in the source directory into individual ZIP files in the output directory using the specified compression level.
   
2. **Set the 7-Zip executable path**
   - Allows you to specify the path to the `7z.exe` file if it is not in the default location.
   
3. **Set the source directory**
   - Specifies the directory containing the folders to be compressed.
   
4. **Set the output directory**
   - Specifies the directory where the ZIP files will be saved.
   
5. **Set compression level (1-9)**
   - Determines the level of compression. Lower values mean faster compression but larger files, while higher values mean slower compression but smaller files.
   
6. **Exclude specific folder(s) by name**
   - Allows you to specify a pattern for folders that should be excluded from compression.
   
7. **Clear log**
   - Clears the existing log file if it exists.
   
8. **About**
   - Displays information about the script, including version and contact details.
   
9. **Exit**
   - Terminates the script.

## Notes

- This .bat file is designed to run with 7zip installed to the default C Drive path (`C:\Program Files\7-Zip\7z.exe`). If 7zip is installed in a different location, open the .bat file in a text editor and change the `SEVENZIP_PATH` variable to the correct path.
- The log file `7zip_batch_zip_all_folders.log` will be created in the same directory as the script and will store information about the compression process.

## Authors
- **Qwen (Alibaba Cloud)**

## Contact
- ai.qwen@alibaba.com

## License
This software is provided "as is" without any warranties or guarantees. Use at your own risk.