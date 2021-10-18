# dotfiles

got this method for tracking dotfiles from this article by Šimon Tóth:

https://medium.com/@happy.cerberus/best-way-to-manage-your-dotfiles-2c45bb280049

text below is quoted directly from the article and consist of the instructions to copy the dotfiles on a second machine

On a second machine, we again define the alias, clone, and checkout.

❯ alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

❯ git clone --bare git@github.com:alonsogmunoz/dotfiles.git $HOME/.dotfiles

❯ dotfiles config --local status.showUntrackedFiles no

❯ dotfiles checkout

If you already have some of the dotfiles present, you will see this error.

error: The following untracked working tree files would be overwritten by checkout:

 .bashrc
 
Please move or remove them before you switch branches.

Aborting

Remove or backup any collisions and repeat the checkout.

❯ mv ~/.bashrc ~/.bashrc_backup

❯ dotfiles checkout
