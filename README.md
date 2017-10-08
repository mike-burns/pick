# Pick

![pick(1) usage](screencast.gif)

The `pick(1)` utility allows users to choose one option from a set of choices
using an interface with fuzzy search functionality.

## Installation

### Debian and Ubuntu

A package for Pick is available as of [Debian 9][Debian]
and [Ubuntu 16.04 LTS][Ubuntu].

```sh
apt-get install pick
```

### Gentoo

Package is available from the [official repo][Gentoo].

```sh
emerge pick
```

### Void Linux

Package is available from the [official repo][Void].

```sh
xbps-install pick
```

### Mac OS X via Homebrew

```sh
brew install pick
```

### Mac OS X via MacPorts

```sh
sudo port install pick
```

### FreeBSD via Ports

```sh
cd /usr/ports/sysutils/pick
make install clean
```

### FreeBSD via pkgng

```sh
pkg install pick
```

### OpenBSD

Available in ports under `sysutils/pick`.

### CRUX

Avaliable in [`6c37/crux-ports`](https://github.com/6c37/crux-ports).

### From source

Download the latest [release] and follow the bundled instructions in
`INSTALL.md`.

If you want to try the latest unreleased version,
follow the instructions in [DEVELOPING.md][current].

[Debian]: https://packages.debian.org/stretch/pick
[Gentoo]: https://packages.gentoo.org/packages/sys-apps/pick
[Void]: https://github.com/voidlinux/void-packages/blob/master/srcpkgs/pick/template
[Ubuntu]: https://packages.ubuntu.com/xenial/pick
[current]: https://github.com/calleerlandsson/pick/blob/master/DEVELOPING.md
[release]: https://github.com/calleerlandsson/pick/releases/

## Usage

`pick(1)` reads a list of choices on `stdin` and outputs the selected choice on
`stdout`. Therefore it is easily used both in pipelines and subshells:

```sh
git ls-files | pick | xargs less # Select a file in the current git repository to view in less
cd "$(find . -type d | pick)"    # Select a directory to cd into
eval $(fc -ln 1 | pick)          # Select a command from the history to execute
```

Pick can also easily be used from within Vim both using `system()` and `!`. For
ready-to-map functions, see [the pick.vim Vim plugin]. For examples of how to
call `pick(1)` from within Vim, see [the pick.vim source code].

***Please note:*** pick requires a fully functional terminal to run and
therefore cannot be run from within gvim or MacVim.

See the `pick(1)` man page for detailed usage instructions and more examples.

[the pick.vim Vim plugin]: https://github.com/calleerlandsson/pick.vim/
[the pick.vim source code]: https://github.com/calleerlandsson/pick.vim/blob/master/plugin/pick.vim

## Copyright

Copyright (c) 2017 Calle Erlandsson, Anton Lindqvist & thoughtbot.
