#
# Elasticsearch Dockerfile
#
# https://github.com/dockerfile/elasticsearch
#

# Pull base image.
FROM jeanblanchard/busybox-java

ENV ES_PKG_NAME elasticsearch-1.5.1

# Install Elasticsearch.
RUN \
  cd / && \
  wget http://download.elastic.co/elasticsearch/elasticsearch/$ES_PKG_NAME.tar.gz && \
  gzip -d $ES_PKG_NAME.tar.gz && \ 
  tar xvf $ES_PKG_NAME.tar && \
  rm -f $ES_PKG_NAME.tar* && \
  mv /$ES_PKG_NAME /elasticsearch

# Define mountable directories.
VOLUME ["/data"]

# Mount elasticsearch.yml config
ADD config/elasticsearch.yml /elasticsearch/config/elasticsearch.yml

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
