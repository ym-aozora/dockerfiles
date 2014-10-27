# MariaDB on CentOS7

MariaDBをCentOS7にインストール。

## 下準備 CentOS7のベースイメージを作成

1. `cd dockerfiles/centos/7`
2. `docker build --rm -t name/centos7`

## MariaDBコンテナのビルド & 実行

1. `cd dockerfiles/mariadb/master`
2. `docker build --rm -t name/mariadb .`
3. `docker run --privileged -d -p 3306:3306 name/mariadb`
