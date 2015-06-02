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

Then, run `apm install --packages-file installed-packages.txt`

### Updating

Make sure to run `apm list --installed --bare > installed-packages.txt` after installing or removing packages so the changes get reflected in this repository.
