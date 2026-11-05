@echo off
setlocal EnableExtensions EnableDelayedExpansion
rem Windows cmd.exe: variables store strings, not typed objects.
rem Delayed expansion reads updates made inside parenthesized blocks.
set "title=Launch checklist"
set "completed=0"

rem There are no native arrays; indexed names model this small list.
set "task[1]=Read the guide"
set "task[2]=Build a sample"
set "task[3]=Share notes"
set "done[1]=yes"
set "done[2]=no"
set "done[3]=no"

rem Update one value before building the report.
set "done[2]=yes"
echo %title%
for /l %%I in (1,1,3) do (
    if "!done[%%I]!"=="yes" (
        set "marker=x"
        set /a "completed+=1" >nul
    ) else (
        set "marker= "
    )
    echo [!marker!] !task[%%I]!
)
echo Completed: %completed%/3

rem CALL and EXIT /B provide subroutines, not language-level functions.
call :DescribePhase "%completed%"
if errorlevel 1 (
    echo The phase could not be described.
    exit /b 1
)

rem Expansion copies a string; modifying the copy leaves the original.
set "draft=%task[1]%"
set "draft=%draft:guide=revised guide%"
echo Original: %task[1]%
echo Draft: %draft%

rem FOR modifiers extract a basename without accessing the file.
for %%F in ("launch-notes.txt") do echo Report label: %%~nF
endlocal
exit /b 0

:DescribePhase
rem Arguments use %%~1 in documentation, but a single percent in code.
if "%~1"=="3" (
    echo Ready to launch
) else (
    echo Keep going
)
exit /b 0
