#!/bin/bash

# Uses ss-server as default.
if [ "${1#-}" != "$1" ]; then
	set -- ss-server "$@"
fi

function print_usage {
  echo
  echo "Usage:"
  echo "  ss-server [OPTIONS]"
  echo
  echo "Options:"
  echo "  -p, --password string           Password of your remote server"
  echo "  -m, --encrypt-method string     Encrypt method: table, rc4, rc4-md5, aes-128-cfb, aes-192-cfb,"
  echo "                                  aes-256-cfb, bf-cfb, camellia-128-cfb, camellia-192-cfb,"
  echo "                                  camellia-256-cfb, cast5-cfb, des-cfb, idea-cfb, rc2-cfb,"
  echo "                                  seed-cfb, salsa20, chacha20"
  echo "  -t, --timeout int               Socket timeout in seconds"
  echo "  -o, --onetime-auth              Enable onetime authentication"
  echo "  -u                              Enable UDP relay"
  echo "  -U                              Enable UDP relay and disable TCP relay"
  echo "  -v                              Verbose mode"
  echo "  --acl string                    Path to ACL (Access Control List)"
  echo "  --fast-open                     Enable TCP fast open, need Linux kernel > 3.7.0"
  echo "  --mtu int                       MTU of your network interface"
  echo
  echo "  -h, --help                      Print this message"
  echo
}

if [ "$1" != "ss-server" ]; then
  exec "$@"
fi

shift
OPTIONS=`getopt -o p:m:t:od:uUvh --long password:,encrypt-method:,timeout:,onetime-auth,dns:,acl:,fast-open,mtu:,help -n shadowsocks -- "$@"`
if [ $? -ne 0 ]; then
  print_usage
  exit 1
fi

SS_HOST="-s 0.0.0.0"
SS_PORT="-p 8989"
SS_USER="-a shadowsocks"

eval set -- "$OPTIONS"
while true; do
  case "$1" in
    -p|--password)            SS_PASSWORD="-k $2";            shift 2;;
    -m|--encrypt-method)      SS_ENCRYPT_METHOD="-m $2";      shift 2;;
    -t|--timeout)             SS_TIMEOUT="-t $2";             shift 2;;
    -o|--onetime-auth)        SS_ONETIME_AUTH="-A";           shift;;
    -d|--dns)                 SS_DNS="-d $2";                 shift 2;;
    -u)                       SS_UDP_RELAY="-u";              shift;;
    -U)                       SS_UDP_RELAY_ONLY="-U";         shift;;
    -v)                       SS_VERBOSE="-v";                shift;;
    --acl)                    SS_ACL="--acl $2";              shift 2;;
    --fast-open)              SS_FAST_OPEN="--fast-open";     shift;;
    --mtu)                    SS_MTU="--mtu $2";              shift 2;;
    --)                                                       shift; break;;
    -h|--help)                print_usage;                    exit 0;;

    *)
      echo "Unexpected argument: $1"
      print_usage
      exit 1;;
  esac
done

if [ -z "$SS_PASSWORD" ]; then
  SS_PASSWORD="$(pwgen -1 8)"
  echo "Generated password: $SS_PASSWORD"
  SS_PASSWORD="-k $SS_PASSWORD"
fi

ss-server $SS_HOST $SS_PORT $SS_USER $SS_PASSWORD $SS_ENCRYPT_METHOD $SS_TIMEOUT $SS_ONETIME_AUTH $SS_DNS $SS_UDP_RELAY $SS_UDP_RELAY_ONLY $SS_VERBOSE $SS_ACL $SS_FAST_OPEN $SS_MTU