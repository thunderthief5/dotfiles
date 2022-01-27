# st - simple terminal

st is a simple terminal emulator for X which sucks less.


## My Patches

This is in the order that I patched everything:

- [scrollback](https://st.suckless.org/patches/scrollback/)
- [scrollback-mouse](https://st.suckless.org/patches/scrollback/)
- [ligatures-scrollback](https://st.suckless.org/patches/ligatures/)

## Requirements

In order to build st you need the Xlib header files.

## Installation

Edit config.mk to match your local setup (st is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install st (if
necessary as root):

```bash
make clean install
```

## Running st

If you did not install st with make clean install, you must compile
the st terminfo entry with the following command:

```bash
tic -sx st.info
```
See the man page for additional details.

## Credits

* Forked from [https://st.suckless.org/](https://st.suckless.org/)
