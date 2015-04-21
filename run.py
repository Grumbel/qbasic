#!/usr/bin/env python3


import sys
import subprocess
import argparse
import os.path
import ntpath


def filename_to_dos(filename):
    p = os.path.relpath(filename, "src/")
    return ntpath.abspath(ntpath.join("c:/basic/", p))


def run_qbasic(filename):
    if not os.path.exists("c:/QBASIC.EXE"):
        raise Exception("c:/QBASIC.EXE missing")
    else:
        dosfilename = filename_to_dos(filename)
        subprocess.call(["dosbox",
                               "-conf", "dosbox.conf",
                               "-c", "mount c c:",
                               "-c", "c:",
                               "-c", "cd basic",
                               "-c", "c:\\QBASIC.EXE /RUN " + dosfilename])


def main():
    parser = argparse.ArgumentParser(description="QBasic Starter")
    parser.add_argument('FILE', action='store', type=str, nargs='+',
                        help=".BAS file to run")
    args = parser.parse_args()

    for filename in args.FILE:
        run_qbasic(filename)


if __name__ == "__main__":
    main()


# EOF #
