# Nginx on CentOS7

NginxをCentOS7にインストール。

## 下準備 CentOS7のベースイメージを作成

1. `cd dockerfiles/centos/7`
2. `docker build --rm -t name/centos7`

## コンテナのビルド & 実行

1. `docker build --rm -t name/nginx .`
2. `docker run --privileged -d -p 80:80 name/nginx`
