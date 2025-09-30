# ripgrep + delta wrapper to get highlighted result
function rgh
    # in case rg is a fish function we use full path to binary
    set rg_bin (which rg)
    $rg_bin --json $argv | delta --syntax-theme "Catppuccin Macchiato"
end
