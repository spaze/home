# `home`
Home is where a home dir is

# Prerequisites
1. [eza](https://github.com/eza-community/eza/blob/main/INSTALL.md#debian-and-ubuntu)
2. [bat](https://github.com/sharkdp/bat?tab=readme-ov-file#on-ubuntu-using-apt)

# Installation

1. Checkout to `~/.local/share`
2. Create symlinks in `~/.local/bin` pointing to the `bin` dir
3. Symlink `~/.bash_aliases` to `config/.bash_aliases`
4. `echo . ~/.local/share/home/config/.bashrc >> ~/.bashrc`
5. `sudo ln --symbolic ~/.local/share/home/config/tmp-michalspacek.cz.conf /etc/tmpfiles.d/tmp-michalspacek.cz.conf` (`michalspacek.cz` only)
6. Check `/etc/ssl/CA/index.txt.attr` equals `~/.local/share/home/config/ssl/CA/index.txt.attr`, copy the file/contents over if not
6. …
