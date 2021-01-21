FROM microsoft/azure-cli

ARG HELM_VERSION
ARG KUBELOGIN_VERSION
ARG KUBECTL_VERSION
ARG KUBESEAL_VERSION
ARG TERRAFORM_VERSION
ARG CUE_VERSION

WORKDIR /config

COPY install.sh .
RUN apk add --no-cache ca-certificates bash curl git \
    && pip install yq && bash install.sh

ENV PATH="${PATH}:/usr/local/go/bin"

CMD bash
