@echo off

set EXPLORER_LOCATION=%cd%

if "%1" == "-help" goto usage
if not "%1" == "" goto set_explorer_location
if "%1" == "" goto excute_explorer

:set_explorer_location
if not exist %1% goto not_folder_error
set EXPLORER_LOCATION=%1%
if not exist %EXPLORER_LOCATION% goto not_folder_error
goto excute_explorer

:excute_explorer
c:\WINDOWS\explorer.exe /e,/root,"%EXPLORER_LOCATION%"
goto end

:usage
 echo Open Windows Explorer
 echo Usage: $0 [-help] [path]
 echo           [path]: folder at which to open Windows Explorer, will
 echo               default to current dir if not supplied.
 echo           [-help] Display help (this message).
 goto end

:not_folder_error
 echo %1% does not exist!
 
:end