FROM node:14-slim AS base
LABEL maintainer="Rhuan Karlus Silva"
RUN apt-get update

FROM base as aws_cli_installer 
RUN apt-get install -y curl python3-pip
RUN pip3 install awscli

FROM aws_cli_installer
ENV AWS_ACCESS_KEY_ID ''
ENV AWS_SECRET_ACCESS_KEY ''
WORKDIR /root/
RUN mkdir .aws
COPY credentials .aws/
COPY config .aws/
COPY start.sh .
RUN chmod +x start.sh
ENTRYPOINT ["/root/start.sh"]
