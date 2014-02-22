# skynet-docker
Skynet.im in a Docker Container

This project will allow you to start hacking Skynet.im 
in Docker. You will need to have Docker installed
and working.

## Getting Started
First use `git clone` to make a copy of this project.
You need a Docker base image with Node.js installed.
One of the following commands should provide that:

    sudo docker pull dockerfile/nodejs

    sudo docker build -t=dockerfile/nodejs github.com/dockerfile/nodejs

With that in place you can build a Skynet.im image:

    sudo docker build -t=skynet:preview .

That command builds a new image based on the dockerfile/nodejs image.
The new image will clone the official Skynet.im project from Github,
then run `npm install`.

## Configure your Skynet.im
See the sample configuration:

    sudo docker run -i skynet:preview cat /skynet/config.js.sample
    
See the current configuration:

    sudo docker run -i skynet:preview cat /skynet/config.js

## Running Skynet
You need a mongodb account, with a user and password.
You need to bind the container port to a host machine port.

    export MONGODB=mongodb://<username>:<password>@<your-mongo-host><port>/<database>
    sudo docker run -i -p 5000:5000 -e MONGODB=$MONGODB skynet:preview node skynet:preview
    
You will see some error messages about Redis, that isn't configured yet. You can add it to
the config.js file and then rebuild your skynet:preview image. Once it is running you can
run (in a different terminal window):

    curl http://localhost:5000/status
    
which should return something like this:

    {"skynet":"online","timestamp":1393089501675,"eventCode":200,"_id":"5308dbdd0c8b720100000004"}

## Next Steps
- Connect to Redis
- Provision datastores: Use dockerfile/mongodb and dockerfile/redis 
    (get everything running within docker)
- Link containers: Use docker links between containers. Will most likely mean
    moving configuration into environment variables. 

## Future
Eventually a script that will provision and link the whole system for you.
Then you can build applications that use the Skynet.im stack.

[https://github.com/skynetim/skynet]
[Twitter](https://twitter.com/skynetim)
[Facebook](https://www.facebook.com/skynetim)

[Docker](http://docker.io)

Docker containerization by Randall Bohn [Twitter](https://twitter.com/rsbohn).

## License
MIT license: see LICENSE file for details. Skynet.im uses a similar license.

