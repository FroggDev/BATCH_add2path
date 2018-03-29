@echo off
REM             _ __ _
REM         ((-)).--.((-))
REM         /     ''     \
REM        (   \______/   )
REM         \    (  )    /
REM         / /~~~~~~~~\ \
REM    /~~\/ /          \ \/~~\
REM   (   ( (            ) )   )
REM    \ \ \ \          / / / /
REM    _\ \/  \.______./  \/ /_
REM    ___/ /\__________/\ \___
REM   *****************************

REM Script call :
REM -------------
REM add2path.bat

REM description : 
REM -------------
REM will add to path the DefaultList defined in the file

REM OR

REM Script call :
REM -------------
REM add2path.bat C:\dev\bin\git\bin C:\dev\bin\php C:\dev\bin\composer C:\dev\bin\ruby\bin C:\dev\bin\node

REM description : 
REM -------------
REM will add to path the list in argument

REM Default List if nothing set as arguments (separated with space)
set DefaultList=C:\dev\bin\git\cmd C:\dev\bin\php C:\dev\bin\composer C:\dev\bin\ruby\bin C:\dev\bin\node C:\dev\bin\java\bin C:\dev\bin\chromedriver C:\dev\bin\graphiz\bin

REM GLOBAL CONFIG VARS
REM List of folders to add to the PATH (Array separated by spaces !)
REM ================================================================
REM If bin path are passed as argument use them, else use LIST2ADD var
if "%*"=="" ( set LIST2ADD=%DefaultList%) else ( set LIST2ADD=%* )
REM
REM default list = git, php, composer, ruby, node
REM ================================================================

REM PREPARATION : Reset & init vars
REM -------------------------------
set "formatedPath="
set "originalPath=%PATH%"

REM STEP 1 : Display information to user
REM ------------------------------------
REM Clean screen
cls
REM ask user
echo You are going to add to the PATH the following folders (press Ctrl+C to cancel) :
REM Display list of folders to add to path
(for %%f in (%LIST2ADD%) do (
   echo - %%f
)) 
REM Make a pause
echo. 
pause
echo. 

REM STEP 2 : Formating informations
REM -------------------------------
REM Adding to path but check if already exist
set /A Count=0
(for %%a in (%LIST2ADD%) do (
	REM check if folder exit
	IF EXIST %%a (
		REM Doing concatenation to formatedPath var with list of path to add
		call set "formatedPath=%%formatedPath%%%%a;"
		REM removing path if already exist to not add it multiple times
		call set "originalPath=%%originalPath:%%a;=%%"
		
		echo Successfully added %%a to the PATH 
		set /A Count+=1 
	) ELSE (
		echo %%a not found, cannot be added to the PATH, skipping...
	)
))

REM STEP 3 : Updating the PATH
REM --------------------------
if %Count% GTR 0 (
set PATH=%originalPath%%formatedPath%
setx PATH %originalPath%%formatedPath%
) else (
echo.
echo Result : Nothing to add to the PATH...
)

REM Make a pause
echo. 
pause
echo. 
