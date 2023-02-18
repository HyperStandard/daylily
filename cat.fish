function cat --wraps=bat --description 'alias cat=bat'
  if test -e (which bat)
      bat $argv
  else
      command cat $argv
  end
end