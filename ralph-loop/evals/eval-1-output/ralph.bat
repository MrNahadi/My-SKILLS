@echo off
setlocal enabledelayedexpansion

set TOOL=%1
set MAX_ITER=%2
if "%TOOL%"=="" set TOOL=claude
if "%MAX_ITER%"=="" set MAX_ITER=10

set ITER=0

:loop
if !ITER! geq !MAX_ITER! (
    echo [ralph] Max iterations reached without completion.
    echo [ralph] Check prd.json for remaining stories and progress.txt for context.
    exit /b 1
)

set /a ITER+=1
echo.
echo [ralph] ============================================
echo [ralph] === Iteration !ITER! / !MAX_ITER! ===
echo [ralph] ============================================
echo.

if "!TOOL!"=="claude" (
    claude --dangerously-skip-permissions --print < prompt.md 2>&1 | PowerShell -Command "& { $input | Tee-Object -FilePath ralph_output.tmp }"
) else if "!TOOL!"=="agy" (
    agy < prompt.md 2>&1 | PowerShell -Command "& { $input | Tee-Object -FilePath ralph_output.tmp }"
) else (
    echo [ralph] Unknown tool: !TOOL!. Use "claude" or "agy".
    exit /b 1
)

findstr /c:"<promise>COMPLETE</promise>" ralph_output.tmp >nul 2>&1
if !errorlevel! equ 0 (
    echo.
    echo [ralph] All stories complete!
    del ralph_output.tmp 2>nul
    exit /b 0
)

del ralph_output.tmp 2>nul
goto loop
