# Author: Carolyn Bozin
# Date: 2/5/24
# Course: CPSC334
# System daemon program that counts seconds
# and outputs the count to a file

from datetime import datetime
from time import sleep
import signal
import sys

def handler(signum, frame):
        try:
                # write to file
                f.write("SIGTERM received, exiting\n")
                f.close()
        except FileNotFoundError as e:
                print(e)
        finally:
                # flush stdout and exit
                print("", flush=True)
                sys.exit()
    
# open file for writing: /tmp/currentCount.out
# make a counter variable = 0 
# set signal handler
f = open('/tmp/currentCount.out', 'w')
cnt = 0
signal.signal(signal.SIGTERM, handler)

while(True):
        # print out name with a colon, curr date and time, cntr variable
        print('Carolyn:', end =' ')
        time_str = datetime.now().strftime("%Y/%m/%d %H:%M:%S")
        print(time_str, end=' ')
        print('#' + str(cnt))
        # write current date & time to the currentCount.out file
        f.write(time_str + ' ')
        # write counter variable to file  
        f.write('#' + str(cnt) + '\n')
        # counter variable ++  and sleep
        cnt += 1
        sleep(1)


