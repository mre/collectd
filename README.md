# docker collectd

Collectd compiled from source.  
(https://github.com/collectd/collectd)

# Usage

Adjust the config file `collectd.conf`.  
Afterwards run a collectd instance like this:

    docker run -it -rm mre0/collectd
    
You can also write your data to any endpoint supported by collectd.  
For instance run the following to write into Kafka:

    docker-compose up