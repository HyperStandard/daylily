function land --description 'caw caw!'
  if not test -d ~/nest
    mkdir ~/nest
  end
  cd ~/nest $argv; 
end
