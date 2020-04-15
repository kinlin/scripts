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
      flag=$flag*(-1)
  fi
  
  if (($flag>0))
  then
      input swipe 320 1200 1100 1200 600
  else
      input swipe 1100 1200 320 1200 600
  fi
  #sleep 0.8
  #input tap 406 172
  #sleep 0.8
  echo "Iteration $i Finished"
done
