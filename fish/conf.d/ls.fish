if not which exa > /dev/null
    function ll
        ls -l $argv
    end

    function la
        ls -la $argv
    end
    exit
end

function ls
    exa --icons $argv
end

function ll
    exa --long --icons --git $argv
end

function la
    exa --all --long --icons --git $argv
end
