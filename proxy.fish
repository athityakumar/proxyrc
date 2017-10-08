function proxy -d 'switch proxies between KGP and home'
    # posible arguments: kgp, home, no argument
    sh ~/.proxyrc $argv
end
