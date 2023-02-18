function fish_right_prompt
  set -l last_command_status $status
  set -l cwd
  set -l error_color "red --bold"

  set_color $error_color 2> /dev/null; or set_color red --bold

  #print the numerical value of the error, todo: unmask this hehe
  if test $last_command_status != 0 > /dev/null
    printf '💔: %d' $last_command_status
    set_color normal
    printf ', '
  end

  #default time display
  set_color $fish_color_autosuggestion 2> /dev/null; or set_color 555
  date "+%m/%d, %H:%M"
  set_color normal
end
