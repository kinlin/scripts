#!/bin/bash

Color_Off='\033[0m'       # Text Reset
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

#Note! Note! Note!  this still not complete, as I think no need to be so complicate to do these things.
#step 1: make sure dir added
#step 2: collect basic *.h/*.c/*.cc
#step 3: generate cscope

#step 1
#TODO  TODO  TODO: please set the right dir and project name so it can work normally
#cpath=/local/mnt/workspace/Mycode
cpath=/local/mnt/workspace/jinlin
#cname=LA.UM.7.1
cname=LA.UM.7.1-20190509154339
#ckernel=msm-4.9 #msm-3.18
ckernel=msm-4.14 #msm-3.18

index=1

#This is for normal AU
Dirs=(
    "vendor/qcom/proprietary/camx-lib-3a"
    "vendor/qcom/proprietary/camx-lib-stats"
    "vendor/qcom/proprietary/chi-cdk"
    "vendor/qcom/proprietary/camx-lib"
    "vendor/qcom/proprietary/mm-camera-ext"
    "vendor/qcom/proprietary/mm-camerasdk"
    "vendor/qcom/proprietary/camx"
    "kernel/$ckernel/drivers/media/platform/msm/camera"
    "kernel/$ckernel/include/media"
    "frameworks/av/include/camera"
    "frameworks/av/camera"
    "frameworks/av/services/camera/libcameraservice"
    "system/media/camera"
    "hardware/libhardware"
    "packages/apps/SnapdragonCamera"
    "hardware/interfaces/camera"
    "kernel/$ckernel/arch/arm64/boot/dts/qcom"
)

# This is for AU + del origin camx + git clone camx
Dirs=(
    "vendor/qcom/proprietary/camx"
    "kernel/$ckernel/drivers/media/platform/msm/camera"
    "kernel/$ckernel/include/media"
    "frameworks/av/include/camera"
    "frameworks/av/camera"
    "frameworks/av/services/camera/libcameraservice"
    "system/media/camera"
    "hardware/libhardware"
    "packages/apps/SnapdragonCamera"
    "hardware/interfaces/camera"
    "kernel/$ckernel/arch/arm64/boot/dts/qcom"
)
if [[ $# -eq 1 && "$1" = "-h" ]]; then
    echo "Usage: "
    echo -e "$Yellow use to generate cscope for code read $Color_Off"
    echo -e "$Yellow -init $Color_Off: will create soft link"
    echo -e "$Yellow -deinit $Color_Off: will delete soft link"
    echo -e "$Yellow if no param, will run cscope $Color_Off"
fi
echo "$# params, $1"
if [[ $# -eq 1 && "$1" = "init" ]]; then
    echo "will create soft links, first time run only"
    for((i=0; i<${#Dirs[*]}; i++))
    do
      var=${Dirs[$i]}

      #I want to find the prefix and rename
      code_dir=${var:0:6}
      prefix=""
      case "$code_dir" in
              "vendor")
                  prefix="vendor"
                  ;;
              "kernel")
                  prefix="kernel"
                  ;;
              "framew")
                  prefix="frameworks"
                  ;;
              "system")
                  prefix="system"
                  ;;
              "hardwa")
                  prefix="hardware"
                  ;;
              "packag")
                  prefix="packages"
                  ;;
              *)
                  prefix=""
                  ;;
      esac

      #echo "1 $var"
      #echo "2 $code_dir"
      #echo "3 ${prefix}"
      ln_name=${i}_${var##*/}
      #ln_name=${i}_${prefix}_${var##*/}
      #echo $var
      #echo ${i}_${var##*/}
      ln -s $cpath/$cname/$var   $ln_name
    done
fi

if [[ $# -eq 1 && "$1" = "deinit" ]]; then
    echo "will clean soft link"
    for((i=0; i<${#Dirs[*]}; i++))
    do
      var=${Dirs[$i]}
      #I want to find the prefix and rename
      code_dir=${var:0:6}
      prefix=""
      case "$code_dir" in
              "vendor")
                  prefix="vendor"
                  ;;
              "kernel")
                  prefix="kernel"
                  ;;
              "framew")
                  prefix="frameworks"
                  ;;
              "system")
                  prefix="system"
                  ;;
              "hardwa")
                  prefix="hardware"
                  ;;
              "packag")
                  prefix="packages"
                  ;;
              *)
                  prefix=""
                  ;;
      esac

      ln_name=${i}_${var##*/}
      #ln_name=${i}_${prefix}_${var##*/}
      #echo $var
      #echo ${i}_${var##*/}
      rm  $ln_name
    done

fi

EXU_FILE="" #"/chromatix/03|test|eztune"

if [ $# -eq 0 ]; then
    date;
    #ctags -R;
    echo "ctags done......"
#    find -L ./ -name  "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" | egrep -v ${EXU_FILE} > cscope.files;
    find -L ./ -name  "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" -o -name "*java" > cscope.files;
    find -L ./ -name "camxsettings.xml" >>cscope.files
    find -L ./ -name "camxproperties.xml" >>cscope.files
#   find -L ./ -name "titan17x_usecases.xml" >>cscope.files
#   now the MTP use common_usecase.xml
    find -L ./ -name "common_usecase.xml" >>cscope.files
    find -L ./ -name "msmnile_usecase.xml" >>cscope.files
    find -L ./ -name "g_msmnile_usecase.xml" >>cscope.files

    date;
    cscope -CRbq -i cscope.files;
    echo "cscope done......"
    date;
fi
