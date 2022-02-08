#!/usr/bin/env python

import argparse

parser = argparse.ArgumentParser(description='GOTM profile format to parsac format conversion tool')
parser.add_argument('profile', type=str, help='GOTM profile formatted file - input')
parser.add_argument('parsac', type=str, help='ParSAC formatted observation file - output')
args = parser.parse_args()

with open(args.profile,'r') as f,open(args.parsac,'w') as f_out:
    while 1:
        l = f.readline()
#        print(l)
        if l.strip()=='': break
        time = l[:19]
        n,direction = l[19:].strip().split()
        for i in range(int(n)):
            z,t = f.readline().rstrip().split()
            f_out.write('%s\t%s\t%s\n' % (time,z,t))
