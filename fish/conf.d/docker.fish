#!/usr/bin/env fish

## Implementation notes: 
## 1. use "do" prefix because of conflict with dlv in list volumes command
## 2. argument is mandratory to make delete all a consious action
## 3. argument is also mandratory for list commands for consistency with remove commands

function __check_name_conflict 
    if which $argv[1] > /dev/null 
        set path (which $argv[1])
        set_color red;
        echo fish function $argv[1] conflicts with $path 1>&2
        set_color normal;
        $path $argv[2..-1]
        return 1
    end
end
function __check_req 
    set res 0
    if not which jq > /dev/null
        set_color red;
        echo jq not found in PATH 1>&2
        set_color normal;
        set res 1
    end
    if not which docker > /dev/null
        set_color red;
        echo docker not found in PATH 1>&2
        set_color normal;
        set res 1
    end
    if [ (count $argv) -lt 1 ]
        set_color red;
        echo at least one argument is reqired 1>&2
        set_color normal;
        set res 1
    end
    return $res
end

# [do]cker [l]ist [c]ontainers
function dolc
    if ! __check_name_conflict (status current-function) $argv
        return 1
    end
    if ! __check_req $argv
        return 1
    end
    switch $argv[1]
        case "all"
            docker ps --all --format json | jq .
        case '*'
            docker ps --all --format json | jq "select((.Names | test(\"$argv[1]\")) or (.Image | test(\"$argv[1]\")))"
    end
end

# [do]cker [l]ist [i]mages
function doli
    if ! __check_name_conflict (status current-function) $argv
        return 1
    end
    if ! __check_req $argv
        return 1
    end
    switch $argv[1]
        case "all"
            docker image ls --format json | jq .
        case '*'
            docker image ls --format json | jq "select(.Repository | test(\"$argv[1]\"))"
    end
end

# [do]cker [l]ist [v]olumes
function dolv
    if ! __check_name_conflict (status current-function) $argv
        return 1
    end
    if ! __check_req $argv
        return 1
    end
    switch $argv[1]
        case "all"
            docker volume ls --format json | jq .Name
        case '*'
            docker volume ls --format json | jq "select(.Name | test(\"$argv[1]\"))"
    end
end

# [do]cker [r]emove [c]ontainers
function dorc
    if ! __check_name_conflict (status current-function) $argv
        return 1
    end
    if ! __check_req $argv
        return 1
    end
    switch $argv[1]
        case "all"
            docker ps --all --format json | jq .ID | xargs -n1 docker rm
        case '*'
            docker ps --all --format json | jq "select((.Names | test(\"$argv[1]\")) or (.Image | test(\"$argv[1]\"))) | .ID" | xargs -n1 docker rm
    end
end

# [do]ocker [r]emove [i]mages
function dori
    if ! __check_name_conflict (status current-function) $argv
        return 1
    end
    if ! __check_req $argv
        return 1
    end
    switch $argv[1]
        case "all"
            docker image ls --format json | jq .ID | xargs -n1 docker image rm
        case '*'
            docker image ls --format json | jq "select(.Repository | test(\"$argv[1]\")) | .ID" | xargs -n1 docker image rm
    end
end

# [do]cker [r]emove [v]olumes
function dorv
    if ! __check_name_conflict (status current-function) $argv
        return 1
    end
    if ! __check_req $argv
        return 1
    end
    switch $argv[1]
        case "all"
            docker volume ls --format json | jq .Name | xargs -n1 docker volume rm
        case '*'
            docker volume ls --format json | jq "select(.Name | test(\"$argv[1]\")) | .Name" | xargs -n1 docker volume rm
    end
end
