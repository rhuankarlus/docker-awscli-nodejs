FROM node:14-slim AS base
LABEL maintainer="Rhuan Karlus Silva"
RUN apt-get update

FROM base as aws_cli_installer 
RUN apt-get install -y curl python3-pip
RUN pip3 install awscli

FROM aws_cli_installer
ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY
RUN mkdir /root/.aws
COPY credentials /root/.aws/
COPY config /root/.aws/
RUN sed -i -e "s/\${aws_access_key_id}/${AWS_ACCESS_KEY_ID}/" -e "s/\${aws_secret_access_key}/${AWS_SECRET_ACCESS_KEY}/" /root/.aws/credentials
CMD ["node"]
