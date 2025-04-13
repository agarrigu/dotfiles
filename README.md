```
 _______________________________
/                               \
|    _     _   ___ _ _          |
|  _| |___| |_|  _|_| |___ ___  |
| | . | . |  _|  _| | | -_|_ -| |
| |___|___|_| |_| |_|_|___|___| |
\                               /
 -------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```
### Installation

Clone into your `$HOME` directory

if you got sudo priviliges run:
```sh
sudo bash scripts/install-script.sh
```

run :
```sh
bash scripts/createsls.sh
```

The first script figures out what package manager you have and installs essential, fancy and neovim packages.
The second creates soft links in `$HOME` to the configuration files in `$HOME/dotfiles`

### Notes

The Telescope and Treesitter plugins tend to depend on very recent versions of Neovim.
If Lazy package manager gives you any trouble when running Neovim for the frist time it's probably that.
Try manually installing the latest Neovim release from github.
