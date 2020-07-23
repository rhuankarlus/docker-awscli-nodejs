# Docker Image with AWS-CLI and NodeJS

The entrypoint of this image will put you on `node` console. So you can call build or any other node operation directly when running it.

## Verions:

- NodeJS: 14
- AWS-CLI: 2

## How to run:

```
docker run \
  -e AWS_ACCESS_KEY_ID=<YOUR-AWS-ACCESS-KEY-ID> \
  -e AWS_SECRET_ACCESS_KEY=<YOUR-AWS-SECRET-ACCESS-KEY> \
  rhuankarlus/docker-awscli-nodejs
```

### Calling `yarn install` on a project

```
cd project-folder

docker run \
  -e AWS_ACCESS_KEY_ID=<YOUR-AWS-ACCESS-KEY-ID> \
  -e AWS_SECRET_ACCESS_KEY=<YOUR-AWS-SECRET-ACCESS-KEY> \
  rhuankarlus/docker-awscli-nodejs yarn install
```
