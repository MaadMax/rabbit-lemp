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
su root
```

```sh
git clone https://github.com/MaadMax/rabbit-lemp.git /tmp/rabbit-lemp
cd /tmp/rabbit-lemp
chmod +x rabbit-lemp.sh
./rabbit-lemp.sh
```


### Development

Want to contribute? Great!

Don't hesitate to modify this repo and to commit your changes! Any help will be appreciated! :)

Thanks to use rabbit-lemp script!

License
----

The MIT License (MIT)

Copyright (c) 2015 Maxime LAFARIE

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.



