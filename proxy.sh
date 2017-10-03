#! /bin/sh

if [ $1 = 'kgp' ]; then
  export proxy=http://172.16.2.30:8080/

  export http_proxy=$proxy
  export https_proxy=$proxy
  git config --global https.proxy $proxy
  git config --global http.proxy $proxy

  mv ~/.ssh/config ~/.ssh/config.backup
  cp ~/.ssh/config.kgp ~/.ssh/config
else
  unset http_proxy
  unset https_proxy
  git config --unset http.proxy
  git config --unset https.proxy

  mv ~/.ssh/config ~/.ssh/config.backup
  cp ~/.ssh/config.home ~/.ssh/config
fi
