function ls --wraps=exa --description 'List contents of directory, including hidden files and folders'
    exa -lgah --icons $argv
end
