# skynet-docker
Start your own Skynet.im in a Docker container.

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
Currently you need to provide a Mongodb and a Redis for your Skynet.im.
You can start with the sample config.js provided:

    sudo docker run -i skynet:preview cat /skynet/config.js.sample > config.js

then edit the file as needed. Adding the config.js file to the skynet image is
left as an exercise for the reader.

## Next Steps
- Configuration: Need to figure out how to connect to Redis
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
