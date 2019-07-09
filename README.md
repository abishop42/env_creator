#README

If docker is not installed run:
	./setup.sh

To spin up the containers runs:
	./init.sh

**Note that I am making the assumption here that docker is run on the same machine as this is being executed on and you have setup your environment as expected**

Two containers are created:
	- sampleweb with http trafic mapped to 5000
	- sampledb running postgres with the  user db1 and password set to password123

To access the web page
	http://localhost:5000/

