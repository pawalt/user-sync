#!/usr/bin/env python

import sys
from subprocess import call
import subprocess

args = sys.argv[1:len(sys.argv)]

if args[0] == "rm" or args[0] == "remove":
    call("vim '+DeleteNote " + " ".join(args[1:len(args)]) + "'", shell=True)
elif args[0] == "n" or args[0] == "new":
    call("vim '+Note " + " ".join(args[1:len(args)]) + "'", shell=True)
elif args[0] == "e" or args[0] == "edit":
    call("vim '+edit note:" + "\\ ".join(args[1:len(args)]) + "'", shell=True)
elif args[0] == "se" or args[0] == "search":
    call("find ~/Documents/Notes/ -name '*" +  " ".join(args[1:len(args)]) + "*'", shell=True)
elif args[0] == "l" or args[0] == "ls":
    files = subprocess.check_output("ls ~/Documents/Notes/", shell=True).replace(".txt", "")
    print files