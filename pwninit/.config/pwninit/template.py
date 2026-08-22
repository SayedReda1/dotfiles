#!/usr/bin/env python3

from pwn import *

{bindings}

context.binary = {bin_name}
context.terminal = ["tmux", "splitw", "-h"]

gdbscript = """
c
"""

def conn():
    if args.LOCAL:
        if args.GDB:
            r = gdb.debug(
                [exe.path],
                gdbscript=gdbscript
            )
        else:
            r = process([exe.path])
    else:
        r = remote("addr", 1337)

    return r


def main():
    r = conn()

    # good luck pwning :)

    r.interactive()


if __name__ == "__main__":
    main()
