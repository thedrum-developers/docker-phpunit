# Supported tags and respective `Dockerfile` links
 - `0.1`, `latest` (*[0.1/Dockerfile](https://github.com/thedrum-developers/docker-phpunit/blob/master/0.1/Dockerfile)*)
 - `0.1-dev` (*[0.1/dev/Dockerfile](https://github.com/thedrum-developers/docker-phpunit/blob/master/0.1/dev/Dockerfile)*)

# Usage
```
docker run -it --rm -v ${PWD}:/app thedrum/phpunit -c phpunit.xml.dist

```