# BATCH_add2path
A simple script to add path to Xindows PATH

## Script call without argument :
```add2path.bat```
will add to path the DefaultList defined in the file

set DefaultList=C:\dev\bin\git\bin C:\dev\bin\php C:\dev\bin\composer C:\dev\bin\ruby\bin C:\dev\bin\node

## Script call with arguments:
```add2path.bat C:\dev\bin\git\bin C:\dev\bin\php```
will add to path the arguments list

## Specificities :
* Check if the path already exist in the PATH (add only new path to PATH)
* Check if folder exist phisically before trying to add to the PATH
* Pause display to prevent accidental use of the script

