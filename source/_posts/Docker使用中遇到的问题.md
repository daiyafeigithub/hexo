title: Docker使用中遇到的问题
author: 青尘
tags:
  - 问题
categories:
  - docker
date: 2021-01-10 17:46:00
---
### 问题1.Docker之WARNING: IPv4 forwarding is disabled. Networking will not work.

#### 解决方法：
```
vim /etc/sysctl.conf

#配置转发
net.ipv4.ip_forward=1

#重启服务，让配置生效
systemctl restart network

#查看是否成功,如果返回为“net.ipv4.ip_forward = 1”则表示成功
sysctl net.ipv4.ip_forward
```

