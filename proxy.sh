#! /bin/sh
check_install() {
  output="$($1 --version)"
  output_size=${#output}

  if [ $output_size -eq 0 ]; then
    echo '0'
  else
    echo '1'
  fi
}

if [ -z "$1" ] || [ $1 != 'kgp' ] ; then
  unset http_proxy
  unset https_proxy

  git_installed=$(check_install git)
  if [ $git_installed -ne 0 ]; then
    git config --unset http.proxy
    git config --unset https.proxy
  fi

  npm_installed=$(check_install npm)
  if [ $npm_installed -ne 0 ]; then
    npm config delete proxy
    npm config delete https-proxy
  fi

  export HTTP_PROXY=''

  mv ~/.ssh/config ~/.ssh/config.backup
  cp ~/.ssh/config.home ~/.ssh/config

  echo "Home, sweet home! No proxy settings."
else
  export proxy=http://172.16.2.30:8080/

  export http_proxy=$proxy
  export https_proxy=$proxy
  git_installed=$(check_install git)
  if [ $git_installed -ne 0 ]; then
    git config --global https.proxy $proxy
    git config --global http.proxy $proxy
  fi

  npm_installed=$(check_install npm)
  if [ $npm_installed -ne 0 ]; then
    npm config set proxy $proxy
    npm config set https-proxy $proxy
  fi
  
  export HTTP_PROXY=$proxy

  mv ~/.ssh/config ~/.ssh/config.backup
  cp ~/.ssh/config.kgp ~/.ssh/config

  echo "Switching to KGP Proxy setting", $proxy
fi
