if not which eza > /dev/null
    function ll
        ls -l $argv
    end

    function la
        ls -la $argv
    end
    exit
end

function ls
    eza --icons $argv
end

function ll
    eza --long --icons --git $argv
end

function la
    eza --all --long --icons --git $argv
end
