#!/bin/bash

set -eux

apk add --no-cache ca-certificates bash curl git && pip install yq

curl -LO "https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl"
chmod +x kubectl
mv kubectl /usr/local/bin

wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm
chmod +x /usr/local/bin/helm
wget -q -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip
unzip terraform.zip -d /usr/local/bin
rm -rf terraform.zip

wget https://github.com/Azure/kubelogin/releases/download/${KUBELOGIN_VERSION}/kubelogin-linux-amd64.zip
unzip kubelogin-linux-amd64.zip
mv bin/linux_amd64/kubelogin /usr/local/bin
chmod +x  /usr/local/bin/kubelogin
rm kubelogin-linux-amd64.zip

wget https://github.com/bitnami-labs/sealed-secrets/releases/download/${KUBESEAL_VERSION}/kubeseal-linux-amd64 -O kubeseal
mv kubeseal /usr/local/bin
chmod +x /usr/local/bin/kubeseal
curl -LO https://github.com/cuelang/cue/releases/download/v${CUE_VERSION}/cue_${CUE_VERSION}_Linux_x86_64.tar.gz

tar xvf cue_${CUE_VERSION}_Linux_x86_64.tar.gz
mv cue /usr/bin
rm cue_${CUE_VERSION}_Linux_x86_64.tar.gz && rm -rf doc

wget https://golang.org/dl/go1.15.7.linux-amd64.tar.gz
tar -C /usr/local -xzf go1.15.7.linux-amd64.tar.gz
echo 'export PATH=$PATH:/usr/local/go/bin' >> /etc/profile

