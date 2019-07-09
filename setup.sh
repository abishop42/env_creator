DB_CONTAINER_NAME=sampledb
WEB_CONTAINER_NAME=sampleweb

install_docker() {
	if ! [ -x "$(command -v docker)" ]; then
	  echo 'installing docker'
	  sudo apt-get update
	  sudo apt-get install docker.io
	fi
}


check_for_container() {
	#to use call check_for_container <name of container>
	result=$( sudo docker ps -f name=$1 )
	if [[ -n "$result" ]]; then
		return 1
	else
		return 0
	fi
}

remove_container() {
	#to use call remove_container <name of container>
	sudo docker rm --force $1
}


setup_db() {
	check_for_container $DB_CONTAINER_NAME
	if [ $? -eq 1 ]; then
		remove_container $DB_CONTAINER_NAME
	fi
	echo "Creating container"
	sudo docker run --name $DB_CONTAINER_NAME -e POSTGRES_PASSWORD=hello -d postgres
	#todo setup data in db
}


setup_web() {
	check_for_container $WEB_CONTAINER_NAME
	if [ $? -eq 1 ]; then
		remove_container $WEB_CONTAINER_NAME
	fi
	echo "Creating container"
	pushd sample_web
	sudo docker build -t flasksample .
	sudo docker run --name $WEB_CONTAINER_NAME -d flasksample
	popd
}

install_docker
setup_db
setup_web
