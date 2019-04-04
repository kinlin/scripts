#!/bin/sh

#Param Needed
dir_to_process=$PWD

#Do I need to do this for interactive?
#read -p "Which ISP dump do you want to convert? \n" isp_module

help() {
    echo "Useage: Convert NV12/NV21/P010 to Jpeg"
}

# IPE Dump Sample
# p[0xeaf80000]_req[212]_batch[0]_IPE[0]_port[8]_w[1920]_h[1080]_20090101_000048.YUV420NV12
# cut -d "_" -f6 is width
# cut -d "_" -f7 is width

# Sample 2
# preview_w[2592]_h[1944]_id[54]_20190115_040201.yuv
# cut -d "_" -f2 is width
# cut -d "_" -f3 is width





convert_NV12(){
#We can Process NV12 first
yuv420nv12_files=`find . -name "*YUV420NV12"`
for nv12_file in $yuv420nv12_files
do
    echo "converting $nv12_file"
    jpegName=`echo $nv12_file|cut -d "." -f1`

    #
    # Please Check the Width And Height Process Here is Good For You
    #
    width=`echo $nv12_file|cut -d "_" -f6|tr -cd "0-9"`
    height=`echo $nv12_file|cut -d "_" -f7|tr -cd "0-9"`

    newYuvfile=`echo "$nv12_file" | sed 's/YUV420NV12/yuv/g'`
    cp $nv12_file $newYuvfile

    newJpgfile=`echo "$nv12_file" | sed 's/YUV420NV12/jpg/g'`
    echo "width: $width"
    echo "height: $height"

    ffmpeg -y -v 0 -s ""$width"x"$height"" -pix_fmt nv12 -i $newYuvfile $newJpgfile
    rm $newYuvfile
    
done
}

convert_NV21(){
#We can Process NV12 first
yuv420nv21_files=`find . -name "*YUV420NV21"`

for file in $yuv420nv21_files
do
    echo "converting $file"
    jpegName=`echo $file|cut -d "." -f1`

    #
    # Please Check the Width And Height Process Here is Good For You
    #
    width=`echo $file|cut -d "_" -f6|tr -cd "0-9"`
    height=`echo $file|cut -d "_" -f7|tr -cd "0-9"`
    echo "width: $width"
    echo "height: $height"

    newYuvfile=`echo "$file" | sed 's/YUV420NV21/yuv/g'`
    cp $file $newYuvfile

    newJpgfile=`echo "$file" | sed 's/YUV420NV21/jpg/g'`

    ffmpeg -y -v 0 -s ""$width"x"$height"" -pix_fmt nv12 -i $newYuvfile $newJpgfile
    rm $newYuvfile
    
done
}



#main Process
convert_NV12
convert_NV21
