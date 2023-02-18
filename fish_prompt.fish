function fish_prompt
    set -l last_command_status $status
    set -l cwd

    #why doesnt every OS have every emoji in every font
    #set -f fire_symbol ❤️‍🔥

    set -f fire_symbol 🔥
    set -f regular_symbol 💚
    set -f error_symbol 💔

    set -f firerror_symbol 💥

    #In case you want the $ or > or whatever. Space feels clean (especially with heart emojis)
    set -f prompt_char " "

    #These are added for indicating on the left whether one is in an SSH and/or screen session
    set -f screen_symbol 📺
    set -f ssh_symbol 🌏

    #indicate we're in an ssh session
    if test -n "$SSH_CLIENT" || test -n "$SSH_TTY"
        printf '{%s} ' $ssh_symbol
    end
    #then, indicate if we're in a screen session
    if test -n "$STY"
        printf '{%s} ' $screen_symbol
    end

    #1: sudo active, 2: error will add more later
    set -f heartsum 0

    if sudo -vn 2>/dev/null
        set -f heartsum (math --scale=0 $heartsum + 1)
        #set $prompt_string $fire_symbol
    end

    if test $last_command_status != 0 >/dev/null
        set -f heartsum (math --scale=0 $heartsum + 2)
    end


    #I want to make a grid of possibilities between e.g. error code AND sudo active (more to come?)
    #doing it using the funny bit math
    switch $heartsum
        case 0 ''
            set -f $prompt_string $regular_symbol
        case 1
            set -f $prompt_string $fire_symbol
        case 2
            set -f $prompt_string $error_symbol
        case 3
            set -f $prompt_string $firerror_symbol
        case '*'
            #i dont know how you even got here
            set -f prompt_string 'error: \"glorp\" >'
    end

    #where the magic happens
    printf '%s%s' $prompt_string $prompt_char


end