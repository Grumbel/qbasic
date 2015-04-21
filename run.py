#!/usr/bin/env python3


import sys
import subprocess
import argparse
import os.path
import ntpath
import glob


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
                               "-c", "cd " + ntpath.dirname(dosfilename),
                               "-c", "c:\\QBASIC.EXE /RUN " + dosfilename])


def show_menu(title, items, default):
    items = [i for x in items for i in x]  # flatten the pairs
    p = subprocess.Popen(["whiptail", "--menu", title, "0", "0", "0"] + items + ["--default-item", default],
                         stderr=subprocess.PIPE)
    stdoutdata, stderrdata = p.communicate()
    if stderrdata == b"":
        return None
    else:
        return stderrdata.decode()


def show_bas_menu():
    files = sorted(glob.glob("src/*.[bB][aA][sS]")) + sorted(glob.glob("src/*/*.[bB][aA][sS]"))
    ret = ""
    while True:
        ret = show_menu("Run QBasic App", [(x, "") for x in files], ret)
        if ret:
            run_qbasic(ret)
        else:
            break


def main():
    parser = argparse.ArgumentParser(description="QBasic Starter")
    parser.add_argument('FILE', action='store', type=str, nargs='*',
                        help=".BAS file to run")
    args = parser.parse_args()

    if args.FILE:
        for filename in args.FILE:
            run_qbasic(filename)
    else:
        show_bas_menu()


if __name__ == "__main__":
    main()


# EOF #
