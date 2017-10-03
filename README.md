# proxyrc

A proxy configuration file that solves the purpose of switching the proxies while travelling to KGP (proxy) and Home (without proxy), with a **SINGLE COMMAND**.

### What all does it do?

1. Set `http_proxy` and `https_proxy` variables
2. Set `git config --global` `http.proxy` and `https.proxy` variables
3. Change `~/.ssh/config` to include Corkscrew

### Setup

1. Be sure to setup your `~/.ssh/config.kgp` and `~/.ssh/config.home` files with the same names (`config.kgp` and `config.home`). For example, my files look like [ssh_config_home](ssh_config_home) and [ssh_config_kgp](ssh_config_kgp).

2. No need to clone the entire repository. Just get the `proxy.sh` file by typing this in your terminal -

```console
$ curl -o ~/.proxyrc https://raw.githubusercontent.com/athityakumar/proxyrc/master/proxy.sh
```

3. Add this to your shell configuration file (`~/.bashrc`, `.zshrc` or `.fishrc`) -

```sh
proxy() { sh ~/.proxyrc $1; }
```

### Usage

1. Switch to KGP environment -

```console
$ proxy kgp
Switching to KGP Proxy setting, http://172.16.2.30:8080/
```

2. Switch to home envrionment (default) -

```console
$ proxy
Home, sweet home! No proxy settings.
```

```console
$ proxy home
Home, sweet home! No proxy settings.
```

### Tweaking

The `proxy.sh` file is quite straight forward. In case of more proxies, add more if-else cases. If there's a change that applies to KGP population, feel free to send a Pull Request here.

### License

MIT LICENSE 2017 - Athitya Kumar
