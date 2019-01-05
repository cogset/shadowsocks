## Shadowsocks in Docker
[![build status badge](https://travis-ci.org/cogset/shadowsocks.svg)](https://travis-ci.org/cogset/shadowsocks)
[![layers badge](https://images.microbadger.com/badges/image/cogset/shadowsocks.svg)](https://microbadger.com/images/cogset/shadowsocks)
### Supported tags and respective Dockerfile links

+ `3.1.3`, `3.1`, `latest` [(3.1/Dockerfile)](https://github.com/cogset/shadowsocks/blob/master/3.1/Dockerfile)
+ `3.2.3`, `3.2`, `latest` [(3.2/Dockerfile)](https://github.com/cogset/shadowsocks/blob/master/3.2/Dockerfile)

------
### Software website
+ [Shadowsocks](https://shadowsocks.org)

------
### Author
+ You Ming (youming@funcuter.org)

------
### Usage

##### Run a Shadowsocks instance
```
$ docker run -d --name shadowsocks -p 8989:8989 cogset/shadowsocks:latest
```
The port of socks server is `8989`.

##### Set authorization
You can use `-p` or `--password` to set authorization. 
```
$ docker run -d --name shadowsocks -p 8989:8989 cogset/shadowsocks:latest -p 1234
```
If you start container without password, a password will be generated automatically.

##### Other options
Use `-h` or `--help` for full usage. 
```
$ docker run -t --name shadowsocks cogset/shadowsocks:latest -h
```
