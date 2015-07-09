# Docker-Collectd

Collectd compiled from source running inside a Docker container.  
(https://github.com/collectd/collectd)

Find this [image on dockerhub](https://registry.hub.docker.com/u/mre0/collectd/)

# Usage

If you want, you can adjust the config file `collectd.conf` to your needs.  
After that, run:

    docker run -it --rm mre0/collectd
    
You can also write your data to any endpoint supported by collectd.  
For instance run the following to write the collectd metrics into Kafka:

    docker-compose up
