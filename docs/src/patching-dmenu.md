# Patching dmenu

1. Clone `dmenu`:

    ```sh
    $ git clone https://git.suckless.org/dmenu
    ```

2. Download the diff file.
3. Run `patch -p1 < .difffile`
4. Delete `config.h` (it gets rebuild using `config.def.h`)
5. Compile: `sudo make install`
