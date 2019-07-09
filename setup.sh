DB_CONTAINER_NAME=sampledb
WEB_CONTAINER_NAME=sampleweb

install_docker() {
	if ! [ -x "$(command -v docker)" ]; then
	  echo 'installing docker'
	  apt-get update
	  apt-get install docker.io
	fi
}


check_for_container() {
	#to use call check_for_container <name of container>
	result=$( sudo docker ps -f name=$1 )
	if [ -n "$result" ]; then
		return 1
	else
		return 0
	fi
}

remove_container() {
	#to use call remove_container <name of container>
	#removes container if it exists
	check_for_container $1
	if [ $? -eq 1 ]; then
		docker rm --force $1
	fi
}


setup_db() {
	echo "Removing previous db docker containers"
	remove_container $DB_CONTAINER_NAME
	echo "Create new db docker container"
	docker run --name $DB_CONTAINER_NAME -e POSTGRES_PASSWORD=hello -d postgres
}


setup_web() {
	DOCKER_IMAGE=flasksample:latest
	remove_container $WEB_CONTAINER_NAME
	cd sample_web
	docker build -q -t $DOCKER_IMAGE .
	docker run -d -p 5000:5000 --name $WEB_CONTAINER_NAME $DOCKER_IMAGE
	cd ..
}


#---- Script execution starts here ----


if [ $(id -u) -ne 0 ]; then 
	printf 'Please run command as follows\n\tsudo setup.sh\n'
	exit 1
fi
pwd
install_docker
setup_db
setup_web
