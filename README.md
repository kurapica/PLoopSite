How to use
===

When you have [OpenResty][] installed, you can try this commands:

```shell
cd ~

yum install git -y
git clone https://github.com/kurapica/PLoopSite site
cd site
git clone https://github.com/kurapica/PLoop
git clone https://github.com/kurapica/NgxLua

mkdir logs
nginx -p `pwd`/ -c conf/nginx.conf

```

Then you can access the website, it'll show all type features current running on the server.