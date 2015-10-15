# rabbit-lemp
Install a LEMP sevrer fast as a rabbit!

What does rabbit-lemp to my server ?

  - It installs an NGINX Server
  - Maria DB
  - APC Cache with autoconfiguration

Several options need to be set :
  - Apache clear uninstall
  - User prompt for options (Cache size, and so on...)
  - OS Choosing between Debian 7 and Debian 8 (for MariaDB install).

### Version
1.0.0

### Tech

rabbit-lemp is fully based on bash script, but this projects is here thanks to :

* Thomas Bondois
* Maxime Lafarie


### Installation

You only need to be logged as root, and to clone the repo in tmp folder for example

```sh
$ su root
```

```sh
$ git clone [git-repo-url] /tmp/rabbit-lemp
$ cd /tmp/rabbit-lemp
$ chmod +x rabbit-lemp.sh
$ ./rabbit-lemp.sh
```


### Development

Want to contribute? Great!

Don't hesitate to modify this repo and to commit your changes! Any help will be appreciated! :)

Thanks to use rabbit-lemp script!

License
----

MIT



