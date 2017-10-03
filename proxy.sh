#! /bin/sh

if [ -z "$1" ] || [ $1 != 'kgp' ] ; then
  unset http_proxy
  unset https_proxy
  git config --unset http.proxy
  git config --unset https.proxy

  mv ~/.ssh/config ~/.ssh/config.backup
  cp ~/.ssh/config.home ~/.ssh/config

  echo "Home, sweet home! No proxy settings."
else
  export proxy=http://172.16.2.30:8080/

  export http_proxy=$proxy
  export https_proxy=$proxy
  git config --global https.proxy $proxy
  git config --global http.proxy $proxy

  mv ~/.ssh/config ~/.ssh/config.backup
  cp ~/.ssh/config.kgp ~/.ssh/config

  echo "Switching to KGP Proxy setting", $proxy
fi
