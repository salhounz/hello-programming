@echo off
setlocal EnableExtensions EnableDelayedExpansion

rem
rem    "Type Systems & Variables"
rem
rem set stores strings; set /a evaluates integer arithmetic and setlocal limits environment changes.
set "score=10"
set /a "score+=5" >nul
set "exampleLanguage=Batch"

rem
rem    "Control Flow Operations"
rem
rem if and for control execution; delayed expansion reads values updated inside blocks.
if !score! geq 10 (set "result=pass") else (set "result=retry")
for %%N in (1 2 3) do (
    set /a "score+=%%N" >nul
)

rem
rem    "Execution Blocks"
rem
rem call invokes a label subroutine; exit /b returns to the caller.
call :Add 2 3 sum

rem
rem    "Code Health & Documentation"
rem
rem rem is the documented comment command; use separate rem lines for longer explanations.
rem A single-line comment.
rem A second line explains expansion or exit-status assumptions.

rem
rem    "Built-In Collections"
rem
rem There are no native array or map types; related environment names can model small collections.
set "color[0]=red"
set "color[1]=blue"
set "first=%color[0]%"

rem
rem    "Data Mutability"
rem
rem Assignment copies an expanded string; there are no general object-reference semantics.
set "copied=%score%"
set /a "copied+=1" >nul

rem
rem    "Access & Encapsulation"
rem
rem setlocal/endlocal restrict environment changes; names and labels remain convention-based.
setlocal
set "privateValue=local"
endlocal

rem
rem    "Design Paradigms & Patterns"
rem
rem Small subroutines establish an explicit argument and result-variable convention.
call :Add 10 20 total

rem
rem    "Memory Management"
rem
rem The interpreter owns variable storage; clearing a variable removes its environment value.
set "temporary=sample"
set "temporary="

rem
rem    "Concurrency & Parallelism"
rem
rem start can launch another process; /wait synchronizes and /b avoids a new console window.
start "" /b /wait cmd /c "exit /b 0"

rem
rem    "Performance Optimization"
rem
rem Prefer built-in commands for small operations and avoid per-item process startup.
set /a "batchTotal=0" >nul
for %%N in (1 2 3) do set /a "batchTotal+=%%N" >nul

echo Hello, World!
endlocal
goto :eof

:Add
setlocal
set /a "localResult=%~1 + %~2"
endlocal & set "%~3=%localResult%"
exit /b 0
