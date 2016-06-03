# micro-image

* Used to create base Docker image upon which all micro services are developed on
* For faster pulls and pushes from the hub , you can flatten the image into a single layer by:
  * Run the micro-image image in a container
  * Export the container and import it to a new image:  
    `$ docker export {container id} | docker import - aye0aye/micro-image:{tag}`
  * Push the flattened image to Docker Hub
