FROM williamyeh/ansible:ubuntu14.04-onbuild
MAINTAINER Sreeprakash Neelakantan <sree@schogini.com>

COPY ansible/hosts /etc/ansible/hosts
COPY ansible/playbook.yml /etc/ansible/playbook.yml
COPY ansible/ansible.cfg /etc/ansible/ansible.cfg

ENV INVENTORY /etc/ansible/hosts
ENV ANSIBLE_HOST_KEY_CHECKING False
ENV PLAYBOOK /etc/ansible/playbook.yml

#docker run --rm -ti -P -v $PWD/ansible:/etc/ansible --name sree-ans sree-ans ansible-playbook /etc/ansible/playbook.yml

#docker run --rm -ti -P -v $PWD/ansible:/etc/ansible --name sree-ans sree-ans ansible all -m ping
#172.17.0.5 | SUCCESS => {
#    "changed": false, 
#    "failed": false, 
#    "ping": "pong"
#}


# docker run --rm -ti -P -v $PWD/ansible:/ansible --name sree-ans sree-ans ansible -i /ansible/hosts all -m ping
# 172.17.0.5 | SUCCESS => {
#    "changed": false, 
#    "failed": false, 
#    "ping": "pong"
# }

#SreeMacMin16GB:ws sree$ docker run --rm -ti -P -v $PWD/ansible:/ansible --name sree-ans -e "INVENTORY=/ansible/hosts" -e "ANSIBLE_HOST_KEY_CHECKING=False" -e "PLAYBOOK=/ansible/playbook.yml" sree-ans ansible -i /ansible/hosts all -m ping
#172.17.0.5 | SUCCESS => {
#    "changed": false, 
#    "failed": false, 
#    "ping": "pong"
#}

#docker run --rm -ti -P -v $PWD/ansible:/ansible --name sree-ans \
#-e "INVENTORY=/ansible/hosts" \
#-e "PLAYBOOK=/ansible/playbook.yml" sree-ans ansible-playbook-wrapper

# docker build -t sree-ans .
#SreeMacMin16GB:ws sree$ docker run --rm -ti -P --name sree-ans sree-ans ansible localhost -m ping 
#localhost | UNREACHABLE! => {
#    "changed": false, 
#    "msg": "Failed to connect to the host via ssh: ssh: connect to host localhost port 22: Cannot assign requested address\r\n", 
#    "unreachable": true
#}


#SreeMacMin16GB:ws sree$ cat ansible/hosts 
#172.17.0.5
#
#[web]
#172.17.0.5

#SreeMacMin16GB:ws sree$ cat ansible/playbook.yml 
#- hosts:
#    - web
#  tasks:
#    - action: ping

