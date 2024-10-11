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
    eza --long --icons $argv
end

function la
    eza --all --long --icons $argv
end
