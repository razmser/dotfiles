# lazygit specifically tries to look for config in ~/Library/Application\ Support/lazygit/config.yml
# if XDG_CONFIG_HOME is not configured explicitly
set -gx XDG_CONFIG_HOME "$HOME/.config"

abbr --add lg lazygit
