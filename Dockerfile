FROM microsoft/azure-cli

ARG HELM_VERSION="v2.13.1"
ARG KUBECTL_VERSION="v1.12.6"
ARG TERRAFORM_VERSION="0.12.3"
ARG AUTH0_VERSION="v0.2.0"

RUN apk add --no-cache ca-certificates bash curl git \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && wget -q -O terraform.zip https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip \
    && unzip terraform.zip -d /usr/local/bin \
    && rm -rf terraform.zip \
    && wget -q -O terraform-provider-auth0.tar.gz https://github.com/alexkappa/terraform-provider-auth0/releases/download/${AUTH0_VERSION}/terraform-provider-auth0_${AUTH0_VERSION}_linux_amd64.tar.gz \
    && tar -xzf terraform-provider-auth0.tar.gz -C /usr/local/bin \
    && rm -rf terraform-provider-auth0.tar.gz \
    && helm init -c

WORKDIR /config
CMD bash
