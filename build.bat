@echo off
setlocal

for /f "tokens=3" %%a in ('reg query "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment" /v PROCESSOR_ARCHITECTURE') do set arch=%%a

echo %arch%
echo.

if "%arch%"=="AMD64" (
    pyinstaller.exe --onefile --windowed --name "MSPCManagerHelper_Preview_v24922_-_we11A_x64" --add-data "locales;locales" --add-binary "tools\procdump\procdump64.exe;." --clean --version-file=version_x64.txt mainWindow.py
) else if "%arch%"=="ARM64" (
    pyinstaller.exe --onefile --windowed --name "MSPCManagerHelper_Preview_v24922_-_we11A_ARM64" --add-data "locales;locales" --add-binary "tools\procdump\procdump64a.exe;." --clean --version-file=version_ARM64.txt mainWindow.py
) else (
    echo UNKNOWN: %arch%
)

pause
endlocal
