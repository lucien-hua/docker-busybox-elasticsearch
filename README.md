## Elasticsearch Dockerfile

This repository contains **Dockerfile** of [Elasticsearch](http://www.elasticsearch.org/) for [Docker](https://www.docker.com/)

### Base Docker Image

* [jeanblanchard/busybox-java](https://github.com/jeanblanchard/docker-busybox-java)


### Installation

1. Install [Docker](https://www.docker.com/).

2. you can build an image from Dockerfile: `docker build -t="busybox-elasticsearch" .`


### Usage

    docker run -d -p 9200:9200 -p 9300:9300 busybox-elasticsearch

#### Attach persistent/shared directories

  1. Create a mountable data directory `<data-dir>` on the host.

  2. Create Elasticsearch config file at `<data-dir>/elasticsearch.yml`.

    ```yml
    path:
      logs: /data/log
      data: /data/data
    ```

  3. Start a container by mounting data directory and specifying the custom configuration file:

    ```sh
    docker run -d -p 9200:9200 -p 9300:9300 -v <data-dir>:/data busybox-elasticsearch /elasticsearch/bin/elasticsearch -Des.config=/data/elasticsearch.yml
    ```

After few seconds, open `http://<host>:9200` to see the result.
