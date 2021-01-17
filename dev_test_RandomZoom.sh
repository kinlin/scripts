#!/bin/bash
#生成400000~500000的随机数 

 function rand(){
  min=$1
  max=$(($2-$min+1))
  num=$(($RANDOM+1000000000)) #增加一个10位的数再求余
  #echo $(($num%$max+$min))
  
  return $(($num%$max+$min))
}





#set m_max = 3
sleep 1
declare -i Pos1=90
declare -i Pos2=890
for i in {1..3}
do
    #i_index = $((i_index+1))
    aaaa= `rand 100 450`
	Pos1 = `echo $?`
    echo "aaa $Pos1"
	rand 800 1000
    Pos2 = `echo $?`
	echo "bbb $Pos2"
    echo "Pos:$Pos1 1620 <-> Pos:$Pos2 1620"

    #adb.exe shell input swipe $Pos1 1620 $Pos2 1620 50
    #adb.exe shell input swipe $Pos2 1620 $Pos1 1620 50
    #echo `adb.exe shell input swipe $(rand 100 450) 1620 $(rand 800 1000) 1620 50`
done



test

