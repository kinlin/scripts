###################
#Author: JinLin 
###################
import sys
import os
import subprocess
import re
import time


PS = "adb shell \"ps | grep "
KILL = "adb shell kill -9 "

def help():
#	print "1. python fastboot_complete.py restart"
#	print "use for restart camera server after Make Changes and want to take effect"
    print "default run restart camera"
    
def getPID(str):
    rtn = 0
    cmd = PS + str + "\""
    proc = subprocess.Popen(cmd, stdin = subprocess.PIPE, \
                                        stdout = subprocess.PIPE, \
                                        stderr = subprocess.PIPE, shell = False)
    thread1 = proc.stdout.read().split(" ")
    for line in thread1:
        if line.isdigit():
            rtn = line
            break
            
    return rtn

def restart():
    pid1 = getPID("qcamera")
    pid2 = getPID("mediaserver")
    pid3 = getPID("cameraserver")

    if not pid1==0: 
        print "Kill qcamera PID: "+str(pid1)
        cmd = KILL + str(pid1)
        os.system(cmd)
    
    if not pid2==0:
        print "Kill mediaserver PID: "+str(pid2)
        cmd = KILL + str(pid2)
        os.system(cmd)
    
    if not pid3==0:
        print "Kill cameraserver PID: "+str(pid3)
        cmd = KILL + str(pid3)
        os.system(cmd)

def rootDevice():
    print "Not added"
    
    
if __name__ == '__main__':
    argc = len(sys.argv)
    
    if argc == 1:
        help()
        restart()
    if argc == 2:
        command = sys.argv[1]
        if command == 'restart' :
            restart()
        elif command == 'root':
            print "root"
            rootDevice()