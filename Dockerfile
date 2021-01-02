FROM bitnami/kubectl:1.18.14

LABEL maintainer "YouSysAdmin <work@sysalex.com>"

COPY init-kubectl kubectl /opt/kubectl/bin/
USER root
RUN chmod +x /opt/kubectl/bin/*
USER 1001

ENV PATH="/opt/kubectl/bin:$PATH"
ENV KUBECONFIG="/tmp/config"
ENTRYPOINT ["kubectl"]

CMD ["--help"]
