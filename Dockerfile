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
    pip install ansible==2.5.7         && \
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
