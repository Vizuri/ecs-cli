FROM alpine:3.4
LABEL maintainer "dtoppin@vizuri.com"
LABEL org.label-schema.vcs-url="https://github.com/Vizuri/ecs-cli"
LABEL org.label-schema.description="AWS ecs-cli, run with -v ~/.aws:/root/.aws -v ~/.ecs:/root/.ecs"
LABEL org.label-schema.docker.cmd="docker run -it -v ~/.aws:/root/.aws -v ~/.ecs:/root/.ecs vizuri/ecs-cli ecs-cli-command"

RUN apk update && apk add ca-certificates && update-ca-certificates
RUN apk add wget

WORKDIR /root

RUN wget https://s3.amazonaws.com/amazon-ecs-cli/ecs-cli-linux-amd64-latest
RUN cp ecs-cli-linux-amd64-latest /usr/local/bin/ecs-cli
RUN chmod +x /usr/local/bin/ecs-cli

ENTRYPOINT [ "/usr/local/bin/ecs-cli" ]

