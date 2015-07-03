
FROM ubuntu:trusty

MAINTAINER Matthias Endler (matthias.endler@trivago.com)

# Install required build tools
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y autoconf libtool bison flex libz-dev gcc g++ git make autotools-dev pkgconf

# Compile librdkafka
RUN cd /tmp && \
    git clone https://github.com/edenhill/librdkafka.git && \
    cd librdkafka/ && \
    ./configure && \
    make && \
    sudo make install && \
    rm -rf /tmp/librdkafka

# Update library search path
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/lib

# Compile collectd 5.5
RUN cd /tmp && \
    git clone https://github.com/collectd/collectd.git && \
    cd collectd/ && \
    git checkout collectd-5.5 && \
    ./build.sh && \
    ./configure --prefix= && \
    make && \
    sudo make install && \
    rm -rf /tmp/collectd

ADD collectd.conf /etc/collectd.conf

CMD ["/sbin/collectd", "-C", "/etc/collectd.conf", "-f"]