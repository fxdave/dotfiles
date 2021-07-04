# Defined in - @ line 1
function d --wraps='sudo systemctl start docker; docker-compose up' --description 'alias d sudo systemctl start docker; docker-compose up'
  sudo systemctl start docker; docker-compose up $argv;
end
