FROM fluent/fluentd-kubernetes-daemonset:v1.14.6-debian-forward-1.0
USER root
WORKDIR /
RUN gem install fluent-plugin-prometheus
RUN gem install fluent-plugin-kubernetes_metadata_filter -v 2.9.1
RUN gem install fluent-plugin-multi-format-parser
RUN gem install fluent-plugin-concat
RUN apt-get update && apt-get install -y curl && apt-get clean
EXPOSE 24231
