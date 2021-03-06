FROM alpine:3.12

ARG VCS_REF
ARG BUILD_DATE

ENV KUBE_LATEST_VERSION="v1.19.2"
ENV HELM_VERSION="v3.3.4"

RUN apk add --no-cache ca-certificates bash git openssh curl python3 py3-pip \
    && wget -q https://storage.googleapis.com/kubernetes-release/release/${KUBE_LATEST_VERSION}/bin/linux/amd64/kubectl -O /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl \
    && wget -q https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz -O - | tar -xzO linux-amd64/helm > /usr/local/bin/helm \
    && chmod +x /usr/local/bin/helm \
    && chmod g+rwx /root \
    && mkdir /config \
    && chmod g+rwx /config \
    && pip3 install awscli \
    && helm plugin install https://github.com/databus23/helm-diff

COPY entrypoint.sh /opt/entrypoint.sh

WORKDIR /config

ENTRYPOINT [ "/opt/entrypoint.sh" ]

CMD ["sh"]
