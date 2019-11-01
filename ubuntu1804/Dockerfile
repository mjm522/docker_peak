FROM ubuntu:18.04

ARG DOCKER_UID
ARG DOCKER_GID
ARG DOCKER_USER

RUN apt-get update && apt-get -y install sudo gcc make nano g++ udev

RUN groupadd --system --gid ${DOCKER_GID} ${DOCKER_USER} \
    && useradd --system --create-home --gid ${DOCKER_GID} --uid ${DOCKER_UID} ${DOCKER_USER} \
    && usermod -aG dialout ${DOCKER_USER} \
    && usermod -aG sudo ${DOCKER_USER} \
    && echo '%sudo ALL=NOPASSWD: ALL' > /etc/sudoers.d/sudo-nopasswd \
    && chmod 0440 /etc/sudoers.d/sudo-nopasswd


# hardware dependencies
RUN sudo apt-get -y install libncurses5-dev libncurses5 libpopt-dev libelf-dev linux-headers-$(uname -r)

RUN mkdir /tmp/p_tmp
COPY install_pcan_peak.sh /tmp/p_tmp
COPY 3rdparty /tmp/p_tmp

#install pcan basic and peak driver
RUN /bin/bash /tmp/p_tmp/install_pcan_peak.sh

USER $DOCKER_USER

CMD /bin/bash