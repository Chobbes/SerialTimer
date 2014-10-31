SerialTimer
===========

Programs to time how fast an Arduino can send things over the serial port.

Installation
------------

It should just install with cabal. You will probably want to install
the [Haskell Platform](https://www.haskell.org/platform/).

    cabal install --bindir=/path/to/where/you/want/the/bin

If you have [nix](http://nixos.org/nix/) you can use `nix-shell` to
run the cabal install, and it will make sure any extra dependencies
have been installed.

Usage
-----

Before running you should upload the code in the `arduino` directory onto an Arduino (the `Makefile` is set up to deal with megas). You should just be able to

    cd arduino
    make upload

Then, with the arduino connected, call SerialTimer with the desired serial port. For example:

    SerialTimer /dev/tty.usbmodemfa131

There is about a ten second delay at the start to deal with the Arduino fiddling with the serial port after a restart.
