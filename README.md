# Supported tags and respective `Dockerfile` links
 - `7.2`, `latest` (*[7.2/Dockerfile](https://github.com/thedrum-developers/docker-phpunit/blob/master/7.2/Dockerfile)*)
 - `7.2-dev` (*[7.2/dev/Dockerfile](https://github.com/thedrum-developers/docker-phpunit/blob/master/7.2/dev/Dockerfile)*)
 - `7.1` (*[7.1/Dockerfile](https://github.com/thedrum-developers/docker-phpunit/blob/master/7.1/Dockerfile)*)
 - `7.1-dev` (*[7.1/dev/Dockerfile](https://github.com/thedrum-developers/docker-phpunit/blob/master/7.1/dev/Dockerfile)*)
 - `5.6` (*[5.6/Dockerfile](https://github.com/thedrum-developers/docker-phpunit/blob/master/5.6/Dockerfile)*)
 - `5.6-dev` (*[5.6/dev/Dockerfile](https://github.com/thedrum-developers/docker-phpunit/blob/master/5.6/dev/Dockerfile)*)
 - `5.5` (*[5.5/Dockerfile](https://github.com/thedrum-developers/docker-phpunit/blob/master/5.5/Dockerfile)*)
 - `5.5-dev` (*[5.5/dev/Dockerfile](https://github.com/thedrum-developers/docker-phpunit/blob/master/5.5/dev/Dockerfile)*)
 - `5.3` (*[5.3/Dockerfile](https://github.com/thedrum-developers/docker-phpunit/blob/master/5.3/Dockerfile)*)
 - `5.3-dev` (*[5.3/dev/Dockerfile](https://github.com/thedrum-developers/docker-phpunit/blob/master/5.3/dev/Dockerfile)*)

# Usage

## Use latest image
```bash
docker run -it --rm -v ${PWD}:/app thedrum/phpunit -c phpunit.xml.dist
```

## Use specific image
```bash
docker run -it --rm -v ${PWD}:/app thedrum/phpunit:7.2 -c phpunit.xml.dist
```

## Use with Xdebug

Specify the image you wish with the `-dev` variant which has Xdebug installed.

The XDEBUG_CONFIG settings will attempt to connect to the Docker bridge network IP.

The PHP_IDE_CONFIG will set the server name of the debug connection to `test.{current directory name}`, for example `test.my-api` which can be used by your IDE to set server
and path mappings.

```bash
docker run -it --rm \
    -e PHP_IDE_CONFIG=serverName=test.$(basename `pwd`) \
    -e XDEBUG_CONFIG="remote_host=$(docker network inspect --format='{{(index (index .IPAM.Config) 0).Gateway}}' bridge) remote_enable=1" \
    -v ${PWD}:/app thedrum/phpunit:7.2-dev -c phpunit.xml.dist
```
