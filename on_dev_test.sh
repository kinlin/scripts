echo "Start Camera"
i=0
flag=1;
#am start com.android.camera/com.android.camera.Camera
sleep 3
while ((i < 5000))
do
  i=$((i+1))
  #input tap 720 2550
  sleep 0.8
  #left->right
  if (($i%5==0))
  then
      flag=-1*$flag
  fi
  
  if (($flag>0))
  then
      adb.exe shell input swipe 320 1200 900 1200 100
  else
      adb.exe shell input swipe 900 900 320 900 100
  fi
  sleep 1
  #input tap 406 172
  #sleep 0.8
  echo "Iteration $i Finished"
done
