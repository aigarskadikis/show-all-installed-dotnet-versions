@echo off
set path=%path%;%~dp0
setlocal EnableDelayedExpansion
set sw=HKLM\SOFTWARE
set npd=Microsoft\NET Framework Setup\NDP
reg query "%sw%\%npd%" > nul 2>&1
if !errorlevel!==0 (
reg query "%sw%\%npd%" /s |^
grep Version |^
grep -v "FileVersion\|ProductVersion\|TargetVersion" |^
sed "s/^.*REG_SZ....//g" |^
gnusort |^
uniq
)
endlocal
pause
