@ECHO off
title ADB Helper
color 0e
mode con:cols=80 lines=33
set version=EOL
goto label1

:label1
cls
echo.
echo   =======================
echo            Menu
echo   =======================
echo.
echo.
echo   [1]  Restart ADB Server
echo   [2]  ADB Show Devices
echo   [3]  ADB Kill Camera Server
echo   [4]  Reboot Device
echo   [5]  Properties Show
echo   [6]  Properties Setting
echo.
echo.
echo.
set datum=date
echo - %date% %time% -
echo.
set /p choice=- Enter your number: 
echo.

if '%choice%'=='1' goto Restart ADB
if '%choice%'=='2' goto Show device
if '%choice%'=='3' goto Kill Camera Server
if '%choice%'=='4' goto reboot
if '%choice%'=='5' goto properity
if '%choice%'=='6' goto propSet


goto :label1

:Restart ADB
adb.exe kill-server
echo.
adb.exe start-server
echo.
echo Restart ADB server Done!
echo.
pause
goto exit

:Show Device
echo Choose! 
echo.
echo [1] ADB
echo [2] Fastboot
echo [3] Exit
echo.
set /p choice= Enter your number: 
echo.
 
if '%choice%'=='1' goto :adb1
if '%choice%'=='2' goto :fastboot1
if '%choice%'=='3' goto :exit

:adb1
adb.exe devices
adb.exe root
adb.exe remount
pause
cls
goto exit

:fastboot1
main\fastboot.exe devices
pause
cls
goto exit


:Kill Camera Server
for /f "tokens=2 delims= " %%i in (' adb.exe shell "ps |grep qcamera" ') do (
echo qcamera pid:%%i
if %%i gtr 0 (
    set pid=%%i
    adb.exe shell "kill  %pid%"
    )
)

for /f "tokens=2 delims= " %%i in (' adb.exe shell "ps |grep mediaserver" ') do (
echo mediaserver pid:%%i
if %%i gtr 0 (
    set pid=%%i
    adb.exe shell "kill  %pid%"
    )
)

for /f "tokens=2 delims= " %%i in (' adb.exe shell "ps |grep cameraserver" ') do (
    echo cameraserver pid:%%i
    if %%i gtr 0 (
        set pid=%%i
        adb.exe shell "kill  %pid%"
    )
)

echo.
pause

for /f "tokens=2 delims= " %%i in (' adb.exe shell "ps |grep qcamera" ') do (
echo New qcamera pid:%%i
)
for /f "tokens=2 delims= " %%i in (' adb.exe shell "ps |grep mediaserver" ') do (
echo New mediaserver pid:%%i
)
for /f "tokens=2 delims= " %%i in (' adb.exe shell "ps |grep cameraserver" ') do (
echo New cameraserver pid:%%i
)

pause

goto exit


:Reboot
echo   [1] Normal
echo   [2] Recovery
echo   [3] Bootloader
echo   [4] Exit
echo.
set /p choice= Enter your number:
echo.
 
if '%choice%'=='1' goto :Normal
if '%choice%'=='2' goto :Recovery
if '%choice%'=='3' goto :Bootloader
if '%choice%'=='4' goto :Exit
goto exit

:Normal
adb.exe reboot || echo Fail, try it again
pause
cls
goto exit

:Recovery
adb.exe reboot recovery || echo Fail, try it again
pause
cls
goto exit

:Bootloader
adb.exe reboot bootloader || echo Fail, try it again
pause
cls
goto exit

:properity
echo.
echo Show the camera properities
echo.
adb.exe shell "getprop|grep persist.camera"
echo.
pause
goto exit



:exit
cls
goto label1

:propSet
echo.
echo Show the camera properities
set /p choice= set persist.camera.stats.haf.debug:
if %choice% geq 0 (
adb.exe shell "setprop persist.camera.stats.haf.debug %choice%"
)
set /p choice= set persist.camera.stats.af.debug:
if %choice% geq 0 (
adb.exe shell "setprop persist.camera.stats.af.debug %choice%"
)
set /p choice= set persist.camera.stats.q3a.debug:
if %choice% geq 0 (
adb.exe shell "setprop persist.camera.stats.q3a.debug %choice%"
)
set /p choice= set persist.camera.hal.debug:
if %choice% geq 0 (
adb.exe shell "setprop persist.camera.hal.debug %choice%"
)
echo.
echo show properities setted:
adb.exe shell "getprop|grep persist.camera"
echo.
pause
goto exit