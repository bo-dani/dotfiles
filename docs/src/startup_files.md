# Startup files

Startup files contain commands that are to be executed on shell startup. As a result, the shell executes commands present in these files automatically to set up the shell.

## .bash_profile

The `.bash_profile` file contains commands for setting environment variables. Consequently, future shells inherit these variables.

In an interactive login shell, Bash first looks for the `/etc/profile` file. If found, Bash reads and executes it in the current shell. As a result, __/etc/profile sets up the environment configuration for all users__.

Similarly, Bash then checks if `.bash_profile` exists in the home directory. If it does, then Bash executes .bash_profile in the current shell. Bash then stops looking for other files such as `.bash_login` and `.profile`.

If Bash doesn’t find `.bash_profile`, then it looks for `.bash_login` and `.profile`, in that order, and executes the first readable file only.

_Note: the equivalent in zsh is `.zshenv`._

## .bashrc

`.bashrc` contains commands that are specific to the Bash shells. Every interactive non-login shell reads `.bashrc` first. Normally `.bashrc` is the best place to add aliases and Bash related functions.

The Bash shell looks for the `.bashrc` file in the home directory and executes it in the current shell using _source_.

## .profile

During an interactive shell login, if `.bash_profile` is not present in the home directory, Bash looks for .bash_login. If found, Bash executes it. If `.bash_login` is not present in the home directory, Bash looks for `.profile` and executes it.

`.profile` can hold the same configurations as `.bash_profile` or `.bash_login`. It controls prompt appearance, keyboard sound, shells to open, and individual profile settings that override the variables set in the `/etc/profile` file.
