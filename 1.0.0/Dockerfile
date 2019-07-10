FROM debian:stretch-slim

LABEL Maintainer="andresnator@gmail.com" \
    Name=debian-ssh-server \
    Version=1.0.0
    
ARG USER=user-ssh
ARG PASS=password-ssh


RUN apt-get update -qq \
  && apt-get install -y -qq \
  openssh-server \
  sudo \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get autoremove

RUN mkdir -p /var/run/sshd && sed -i "s/UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config \
  && sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && touch /root/.Xauthority \
  && true

RUN useradd ${USER} &&\
  addgroup ${USER} sudo &&\
  /bin/bash -c "echo -e '${PASS}\n${PASS}' | passwd ${USER}  > /dev/null 2>&1"	 &&\
  mkdir -p /home/${USER}/.ssh &&\
  chmod 700 /home/${USER}/.ssh

COPY remote_key.pub /home/${USER}/.ssh/authorized_keys

RUN chown ${USER}:${USER} -R /home/${USER} && \
  chmod 600 /home/${USER}/.ssh/authorized_keys

CMD ["/usr/sbin/sshd", "-D"]
