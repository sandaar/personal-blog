#!/bin/bash
DO_TOKEN=$(sed -n 's/access-token: //p' ${HOME}/.config/doctl/config.yaml)
SSHKEY_FINGERPRINT=$(ssh-keygen -E md5 -lf ${HOME}/.ssh/id_rsa.pub | awk '{print $2}' | sed 's/MD5://g')
echo "do_token = \"${DO_TOKEN}\"" > terraform.tfvars
echo "pub_key = \"${HOME}/.ssh/id_rsa.pub\"" >> terraform.tfvars
echo "pvt_key = \"${HOME}/.ssh/id_rsa\"" >> terraform.tfvars
echo "ssh_fingerprint = \"${SSHKEY_FINGERPRINT}\"" >> terraform.tfvars
