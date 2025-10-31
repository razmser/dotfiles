function git
    # forbid usage of git push --force
    if test (count $argv) -ge 2
        if test $argv[1] = "push"
            if contains -- "--force" $argv
                and not contains -- "--force-with-lease" $argv
                echo "⚠️  Use gpf alias of --force-with-lease instead of --force!"
                return 1
            end
        end
    end
    command git $argv
end

