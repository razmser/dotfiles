set CARGO_ENV "$HOME/.cargo/env.fish"

if test -f $CARGO_ENV
    source $CARGO_ENV
end
