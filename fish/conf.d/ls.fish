if not which lsd > /dev/null
    exit
end

abbr --add ls lsd -h
abbr --add ll lsd -lh
abbr --add la lsd -alh
