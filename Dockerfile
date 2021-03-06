#Change the _groupid with your groupID for docker group
FROM jenkins/jenkins:lts
USER root
ARG _groupid=132
RUN apt-get update -q && \
    apt-get install -qy apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update -q && \
    apt-get install -qy docker-ce docker-ce-cli containerd.io && \
    groupmod -g ${_groupid} docker && \
    usermod -aG docker jenkins && \
    chown -R jenkins:jenkins $JENKINS_HOME/

USER jenkins
