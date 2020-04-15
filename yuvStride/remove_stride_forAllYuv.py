from struct import *
import os,sys

def findYUVAndProcess(path):
    for filename in os.listdir(path):
        #print filename
        #print os.path.splitext(filename)
        if(os.path.splitext(filename)[1] == ".YUV"):
            print "-----------find YUV "+filename
            processStride(filename)


def processStride(filename):
    piece_size = 1 # 4 KiB
    
    width = 1920
    height = 1080
    
    stride_width = 2048
    stride_height = 1536
    
    i = 0
    j = 0
    
    firstname = os.path.splitext(filename)[0]
    outputname = firstname+"_out"+".YUV"
    with open(filename, "rb") as in_file, open(outputname, "wb") as out_file:
        for i in range(stride_height):
            for j in range(stride_width):
                piece = in_file.read(piece_size)
                if j >=width or i >=height:
                    continue
                out_file.write(piece)
                
        for i in range(stride_width*2):
            continue
    
        for i in range(int(stride_height)):
            for j in range(int(stride_width)):
                piece = in_file.read(piece_size)
                if j >= width or i >=height/2:
                    continue
                out_file.write(piece)

if __name__ == "__main__":
    argc = len(sys.argv)
    path =  os.getcwd()
    if argc==1:
        print "finding YUV in "+path
        findYUVAndProcess(path)