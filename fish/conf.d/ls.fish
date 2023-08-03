if not which lsd > /dev/null
    return
end

abbr --add ls lsd -h
abbr --add ll lsd -lh
abbr --add la lsd -alh
