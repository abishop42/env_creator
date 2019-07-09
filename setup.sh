install_docker() {
	sudo apt-get update
	if ! [ -x "$(command -v docker)" ]; then
	  echo 'installing docker'
	  sudo apt-get install docker.io
	fi

	if ! [ -x "$(command -v docker-compose)" ]; then
	  echo 'installing docker-compose'
	  sudo apt-get install docker-compose
	fi

	sudo groupadd docker
	sudo usermod -aG docker $USER

}

install_docker
