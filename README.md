# Usage

This is to add docker to jenkins image

Make sure you substitute the docker group ID with your docker groupID

To build:

```
docker build -f Dockerfile -t jenkins/jenkins:lts_docker .
```

To run:

```
docker run -dit --name $NAME -v $JENKINS_VOL:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts_docker
```
