# Apache Kafka Producer/Consumer example for Node.js with Docker

## Getting started

Setup your free Apache Kafka instance here: https://www.cloudkarafka.com

**Configuration**

* `export CLOUDKARAFKA_BROKERS="host1:9094,host2:9094,host3:9094"`
  Hostnames can be found in the Details view in for your CloudKarafka instance.
* `export CLOUDKARAFKA_USERNAME="username"`
  Username can be found in the Details view in for your CloudKarafka instance.
* `export CLOUDKARAFKA_PASSWORD="password"`
  Password can be found in the Details view in for your CloudKarafka instance.
* `export CLOUDKARAFKA_TOPIC="default"`
  Topic name without the "prefix-" that is your username.

**Running the example project**

```
git clone https://github.com/CloudKarafka/nodejs-kafka-example.git
cd nodejs-kafka-example
cp .env.example .env
# now add your own credentials from the dashboard to the `.env` file
sudo docker build -t nodejs-kafka .
sudo rm -rf node_modules
CURRENT_FOLDER=${PWD}
sudo docker run --name nodejs-kafka-consumer -v ${CURRENT_FOLDER}:/usr/local/app -e JS_FILE=consumer.js nodejs-kafka

# now open another terminal to the same folder and run:
CURRENT_FOLDER=${PWD}
sudo docker run --name nodejs-kafka-producer -v ${CURRENT_FOLDER}:/usr/local/app -e JS_FILE=producer.js nodejs-kafka
```

To remove any containers or images, here are some useful commands:

```
sudo docker ps  # list all running containers
sudo docker exec -it container_name /bin/bash  # enter the container through an interactive shell
sudo docker start container_name  # start an exited container in the background
sudo docker logs -f container_name  # watch the logs of a container running in the background
sudo docker container kill container_id  # kill a running container by its id
sudo docker container ls -a  # list all containers
sudo docker container rm container_id  # remove a container by its id
sudo docker image ls  # list all images
sudo docker image rm nodejs-kafka  # remove the image
```

After a clean install of Docker, you might need to enable and start the service:

```
sudo systemctl enable docker
sudo systemctl start docker
```
