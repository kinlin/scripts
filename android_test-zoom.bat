set countor=0
:func
    adb shell input touchscreen swipe 218 2187 1248 2144 100
    set /a countor+=1
    sleep 3
    adb shell input touchscreen swipe 1248 2144 218 2187 100
if %countor%==1000 goto end
goto func
:end
pause