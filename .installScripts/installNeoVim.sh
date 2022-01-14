#!/usr/bin/sh

apt-get install gdebi fdfind ripgrep
curl "https://github.com/neovim/neovim/releases/download/v0.6.1/nvim-linux64.tar.gz" -o "$HOME"
tar -zxf "$HOME/nvim-linux64.tar.gz"
cp -a "$HOME/nvim-linux64/." "/usr"
rm nvim-linux64 nvim-linux64.tar.gz

# nvim dependecies, I think. It makes :checkhealth make more green checks.
python -m install --user --ugrade pynvim
npm install -g neovim
