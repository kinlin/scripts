set countor=0
:func
    adb shell -s 17a2502c input touchscreen swipe 181 1881 432 1881 100
    set /a countor+=1
    adb shell -s 17a2502c input touchscreen swipe 432 1881 181 1881 100
if %countor%==1000 goto end
goto func
:end
pause