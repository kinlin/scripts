cur_dir=$PWD
alias ls='ls -lart --color=tty'
alias ll="ls -lart --color=tty --show-control-chars"
alias grep='grep --color=auto'
alias ..='cd ..'
alias ..2='cd ../../'
alias ..3='cd ../../../'
alias ..4='cd ../../../../'
alias ..5='cd ../../../../../'

alias cmm='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/mm-camera'
alias ccore='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/mm-camera-core'
alias c3a='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/mm-3a-core'
alias chal='cd $ANDROID_BUILD_TOP/hardware/qcom/camera'
alias clib='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/mm-camera-lib'
alias csdk='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/mm-camerasdk'
alias cout='cd $ANDROID_BUILD_TOP/out/target/product/msm8998/system/vendor/lib'
alias readcode1='cd /local/mnt/workspace/Mycode/read_project'
alias readcode2='cd /local/mnt/workspace/Mycode/LA.UM.read_project'

alias c53='cd /local/mnt/workspace/Mycode/Laum00/out/target/product/msm8953_64/system/vendor/lib'

alias jcamx='cd $ANDROID_BUILD_TOP/vendor/qcom/proprietary/camx'
alias jout='cd $ANDROID_BUILD_TOP/out/target/product/sdm845/vendor/lib'
alias jbug='cd /mnt/c/Bug_Log'
alias juser='cd /mnt/c/Users/jinlin'

alias glog='git log --pretty=oneline|head -5'


eval `ssh-agent`
ssh-add ~/.ssh/jinlin

function mmcamx() {
   mm  CAMX_PATH_PREFIX=vendor/qcom/proprietary/camx  KERNEL_DEFCONFIG=sdm845-perf_defconfig -j8 2>&1 | tee makelog.txt
}

function ssh-gv() {
   ssh jinlin@10.238.176.30
}



function man() {
  env \
  LESS_TERMCAP_mb=$(printf "\e[1;31m") \
  LESS_TERMCAP_md=$(printf "\e[1;31m") \
  LESS_TERMCAP_me=$(printf "\e[0m") \
  LESS_TERMCAP_se=$(printf "\e[0m") \
  LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
  LESS_TERMCAP_ue=$(printf "\e[0m") \
  LESS_TERMCAP_us=$(printf "\e[1;32m") \
  man "$@"
}

function camxsetting() {
  c_settings=$1
  echo "set $c_settings"
  adb shell "echo "$c_settings" >>/vendor/etc/camera/camxoverridesettings.txt"
  adb shell cat /vendor/etc/camera/camxoverridesettings.txt|grep $c_settings|tail -1
}

#path
#export PATH=/mnt/c/Tools/adb:$PATH
export PATH=/mnt/c/Tools/ADB_and_Fastboot:$PATH
export PATH=/mnt/c/Bug_Log/Tools/bin:$PATH
#declare -x PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
#declare -x LANG="zh_CN.GB18030"
#declare -x LANGUAGE="zh_CN.GB18030:zh_CN.GB2312:zh_CN"
declare -x HISTSIZE="5000"

cd /mnt/c/Code/Camx

alias ag='ag -p='~/' -if'

alias adb='adb.exe'

function resetcam() {
#     pid_1=`adb shell ps| grep 'camera.provider' | grep -v grep | awk '{print $2}'`; echo "camera.provider Pid:"$pid_1;
     adb shell "ps -e|grep cameraserver"
     pid_cameraserver=`adb shell ps -e| grep cameraserver | grep -v grep | awk '{print $2}'`; echo "cameraserver Pid:"$pid_cameraserver;
     arr=(${pid_cameraserver//,/ })
     echo "${arr[0]}  ${arr[1]}"
     echo "`sleep 1` will sleep 1"
     adb shell kill -9 ${arr[0]}
     echo "`sleep 1` will sleep 1"
     adb shell kill -9 ${arr[1]}

     echo "kill thread done..., new server is below"
     adb shell "ps -e|grep cameraserver"
}

function adb_reboot() {
    date
    echo "will delete the IPE dump first"
    adb shell "rm -rf /data/vendor/camera"
    adb reboot
    adb wait-for-device root
    adb wait-for-device remount
    adb shell logcat -G 256M
    date
}

#server1: vivo1234
alias vivo_server1='ssh develop01@10.238.180.209'

#server2: af1c36
alias vivo_server2='ssh develop02@10.238.180.209'

#server3: 99b716
alias vivo_server3='ssh develop03@10.238.180.209'

alias oneplus_server='ssh oneplus@10.238.140.94'

alias jeffery_server='ssh c_shuawa@10.238.139.204'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# cdf - cd into the directory of the selected file
cdf() {
    local file
    local dir
    file=$(fzf +m -q "$1") && dir=$(dirname "$file") && cd "$dir"
}

vimf()
{
    vim $(fzf --height 40%)
}

alias afbf='ssh lcc-sha01'

#mysync()
#{
#    curDir=$PWD
#    cd /mnt/c/Users/jinlin/OneDrive
#    rm -rf myWiki/*
#    #tar czf MyLearning.tar.gz MyLearning/
#    #rm -rf MyLearning/*
#    rsync -avr --progress --exclude "*pptx" /mnt/c/vimwiki/   /mnt/c/Users/jinlin/OneDrive/myWiki/vimwiki/
#    rsync -avr --progress  --exclude "*pptx" /mnt/c/vimwiki_html/   /mnt/c/Users/jinlin/OneDrive/myWiki/vimwiki_html
#    rsync -avr --progress  --exclude "*pptx" /mnt/c/vimwiki-assets/   /mnt/c/Users/jinlin/OneDrive/myWiki/vimwiki-assets
#    #rsync -avr --progress  --exclude "*pptx" /mnt/c/MyLearning  /mnt/c/Users/jinlin/OneDrive/MyLearning/
#    time=$(date +%Y-%m-%d)
#    #tar czf myWiki-$time.tar.gz myWiki/
#    zip -r myWiki-$time.zip myWiki/
#    rm -rf myWiki/*
#    cd $curDir
#}

wikisync()
{
    curDir=$PWD
    cd /mnt/c/mygithub/mywiki
    rsync -avr --progress --exclude "*pptx" --excludu ".git" /mnt/c/vimwiki/  ./vimwiki/
    rsync -avr --progress  --exclude "*pptx"  --excludu ".git" /mnt/c/vimwiki_html/   ./vimwiki_html
    #rsync -avr --progress  --exclude "*pptx" /mnt/c/vimwiki-assets/   ./vimwiki-assets
    cd /mnt/c/mygithub/
    time=$(date +%Y-%m-%d)
    zip -r mywiki-$time.zip mywiki/
    cp mywiki-$time.zip /mnt/c/Users/jinlin/OneDrive/
    cd curDir
}

cd $cur_dir
