@echo off
rem IsItSMP auto-updater. Your launcher runs this before the game starts (pre-launch hook);
rem it downloads whatever changed in the pack since your last launch.
setlocal
cd /d "%~dp0"
if not defined ISITSMP_PACK_URL set "ISITSMP_PACK_URL=https://raw.githubusercontent.com/IsItWam/IsItSMP-pack/main/pack.toml"

set "JAVA="
rem The Modrinth App passes its Java as the first argument ("$INST_JAVA").
if not "%~1"=="" if exist "%~1" set "JAVA=%~1"
if not defined JAVA if defined INST_JAVA if exist "%INST_JAVA%" set "JAVA=%INST_JAVA%"
if not defined JAVA if defined JAVA_HOME if exist "%JAVA_HOME%\bin\java.exe" set "JAVA=%JAVA_HOME%\bin\java.exe"
if not defined JAVA for /f "delims=" %%j in ('where java 2^>nul') do if not defined JAVA set "JAVA=%%j"
if not defined JAVA for /d %%d in ("%APPDATA%\gdlauncher_carbon\data\managed_javas\*") do if exist "%%d\bin\java.exe" set "JAVA=%%d\bin\java.exe"
if not defined JAVA for /d %%d in ("%APPDATA%\ModrinthApp\meta\java_versions\*") do if exist "%%d\bin\java.exe" set "JAVA=%%d\bin\java.exe"
if not defined JAVA (
    echo IsItSMP updater: could not find Java. Install Java 21 or set JAVA_HOME.
    exit /b 1
)

"%JAVA%" -jar packwiz-installer-bootstrap.jar "%ISITSMP_PACK_URL%"
