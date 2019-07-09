#README

If docker is not installed run:
	./setup.sh

To spin up the containers run:
	./init.sh

**Note that I am making the assumption that docker is run on the same machine as this is being executed on, and the user has the ability to deploy to the docker instance.**

Two containers are created:
	- sampleweb with http traffic mapped to 5000
	- sampledb running postgres with the  user db1 and password set to password123

To access the web page
	http://localhost:5000/

