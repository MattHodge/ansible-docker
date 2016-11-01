# FROM ubuntu:14.04.5
#
# RUN apt-get update -y && \
#   apt-get install software-properties-common -y && \
#   apt-add-repository ppa:ansible/ansible -y && \
#   apt-get update && \
#   apt-get install ansible python-pip tree git python-dev libkrb5-dev krb5-user -y && \
#   pip install pywinrm xmltodict kerberos requests_kerberos && \
#   apt-get clean && \
#   rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
#
# WORKDIR /ansible
#

#FROM python:2.7-alpine
FROM alpine:3.4

RUN echo "===> Installing sudo to emulate normal OS behavior..."  && \
    apk --update add sudo                                         && \
    \
    \
    echo "===> Adding Python runtime..."  && \
    apk --update add python py-pip openssl ca-certificates    && \
    apk --update add --virtual build-dependencies \
                python-dev libffi-dev openssl-dev build-base  && \
    pip install --upgrade pip cffi                            && \
    \
    \
    echo "===> Installing handy tools (not absolutely required)..."  && \
    apk --update add sshpass openssh-client rsync krb5 krb5-dev && \
    \
    \
    echo "===> Installing Ansible..."  && \
    pip install ansible==2.2.0.0         && \
    \
    \
    echo "===> Installing pip packages ..."  && \
    pip install pywinrm xmltodict kerberos requests_kerberos && \
    \
    \
    echo "===> Removing package list..."  && \
    apk del build-dependencies            && \
    rm -rf /var/cache/apk/*

# default command: display Ansible version
CMD [ "ansible-playbook", "--version" ]
