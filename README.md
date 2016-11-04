## Shadowsocks in Docker
[![build status badge](https://travis-ci.org/youmingdot/docker-shadowsocks.svg)](https://travis-ci.org/youmingdot/docker-shadowsocks5)
[![layers badge](https://images.microbadger.com/badges/image/youmingdot/shadowsocks.svg)](https://microbadger.com/images/youmingdot/shadowsocks)
### Supported tags and respective Dockerfile links

+ `2.5.5`, `2.5`, `latest` [(2.5/Dockerfile)](https://github.com/youmingdot/docker-shadowsocks/blob/master/2.5/Dockerfile)

------
### Author
+ You Ming (youming@funcuter.org)

------
### Usage

##### Run a Shadowsocks instance
```
$ docker run -d --name shadowsocks -p 8989:8989 youmingdot/shadowsocks:latest
```
The port of socks server is `8989`.

##### Set authorization
You can use `-p` or `--password` to set authorization. 
```
$ docker run -d --name shadowsocks -p 8989:8989 youmingdot/shadowsocks:latest -p 1234
```
If you start container without password, a password will be generated automatically.

##### Other options
Use `-h` or `--help` for full usage. 
```
$ docker run -t --name shadowsocks youmingdot/shadowsocks:latest -h
```

------
### Apologize for my poor English
If there's any grammar or word mistakes, please point out.
如果发现有语法或者用词错误，敬请指出。
