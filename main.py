#!/usr/bin/env python

from app import makeApp
from uvicorn import run
from sys import exit
from argparse import ArgumentParser

def parseArgs() -> None:
    pass

if __name__ == '__main__':
    try:
        run(makeApp(), host='127.0.0.1', port=32125)
    except Exception:
        exit(1)
    else:
        exit(0)
