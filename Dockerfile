FROM python:3.9-slim-buster
# install needed packages
RUN apt-get update \
    && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends locales python3 python3-pip git curl openssh-client \
    && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

RUN python3 -m pip install ansible==2.9 paramiko ciscoconfparse

# set up the environment
ENV LANG en_US.utf8
ENV LANGUAGE en_US
ENV LC_ALL en_US.utf8

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_SSH_PIPELINING True

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]