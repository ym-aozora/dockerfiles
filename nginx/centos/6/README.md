# Nginx on CentOS6

NginxをCentOS6にインストール。

## コンテナのビルド & 実行

1. `docker build --rm -t name/nginx .`
2. `docker run --privileged -d -p 80:80 name/nginx`
