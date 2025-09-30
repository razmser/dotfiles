install:
    mkdir -p ~/.config
    stow --target ~/.config/ --ignore fish .
    mkdir -p ~/.config/fish/conf.d
    stow --target ~/.config/fish/conf.d --dir fish/conf.d .
    stow --target ~/.config/fish/functions --dir fish/functions .

