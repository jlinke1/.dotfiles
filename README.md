# .dotfiles
My dotfiles 🤷‍♂️


## How to setup
single:
    stow --verbose --target=$$HOME/.config \<package\>

all:
    stow --verbose --target=$$HOME/.config --restow */

delete:
    stow --verbose --target=$$HOME/.config --delete */
