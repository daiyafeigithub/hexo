title: MySQL5.x安装
author: 青尘
tags:
  - MySQL
categories: []
date: 2021-01-01 21:21:00
---

## 下载安装包

```centos
wget https://cdn.mysql.com//Downloads/MySQL-5.7/mysql-5.7.29-1.el7.x86_64.rpm-bundle.tar
```



## 卸载mariadb-lib

安装新版mysql前，需将系统自带的mariadb-lib卸载

###### 先查看系统是否安装了mariadb-lib

```
rpm -qa|grep mariadb
```



###### 卸载mariadb

```
yum remove mariadb
```





## 解压mysql的tar包

先创建解压到的文件夹mysql/，并赋予其权限,然后进入mysql文件夹

```
mkdirs mysql
chmod -R 777 mysql
cd mysql
```

解压

```
tar -xvf mysql-5.7.29-1.el7.x86_64.rpm-bundle.tar
```





## 安装rpm包

 严格按照顺序安装：

mysql-community-common-5.7.29-1.el7.x86_64.rpm、

mysql-community-libs-5.7.29-1.el7.x86_64.rpm、

mysql-community-client-5.7.29-1.el7.x86_64.rpm、

mysql-community-server-5.7.29-1.el7.x86_64.rpm

这四个包即可

如果安装过程中出现这个错误就在后面添加 --force --nodeps即可



## 配置数据库

```
vim /etc/my.cnf
```

添加这三行

```
skip-grant-tables  
character_set_server=utf8 
init_connect='SET NAMES utf8'
```



## 启动mysql数据库服务，登录数据库

```
systemctl start mysqld.service
mysql
```



## 修改密码

```
update mysql.user set authentication_string=password('123456') where user='root';
flush privileges;
alter user 'root'@'localhost' identified by '123456';
```



## 修改/etc/my.cnf配置文件，注释skip-grant-tables，重启数据库

```
#skip-grant-tables
systemctl restart mysqld
```



## 再次登录数据库，此次登录需要密码123456

```shell
mysql -uroot -p123456
```



## 如果外部网络访问连接数据库失败，添加3306端口通过防火墙

```shell
firewall-cmd --zone=public --add-port=3306/tcp --permanent
```



## 重启防火墙

```shell
firewall-cmd --reload
```

