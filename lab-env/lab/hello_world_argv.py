#!/usr/bin/env python3
import sys

def greetings(name):
    if len(name):
        print("hello %s" % name)
    else:
        print("hello world")

def main():        
    if len(sys.argv) == 2:
        greetings(sys.argv[1])
    else:
        greetings('')

if __name__ == '__main__':
    main()
