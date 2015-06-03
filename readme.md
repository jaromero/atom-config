# atom-config

Personal configuration for the [Atom](http://atom.io) editor.

### How to use

First, install Atom (obviously).

Then `git clone` this repository into `~/.atom` or wherever your Atom configuration is supposed to be.

Example:

```bash
$ cd ~
$ git clone git://github.com/jaromero/atom-config.git .atom
```

Then, install the [package-sync](http://atom.io/packages/package-sync) package (`apm install package-sync`), and run **Package Sync: Sync** to install all your packages.

### Updating

Within Atom, run **Package Sync: Sync** to sync your installed packages and the package list (packages.cson), and then commit your changes.
