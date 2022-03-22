---
title: image
date: 2021-03-11 11:42:54
---
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Document</title>
</head>
<style>
  *{
    margin:0 auto;
  }
  .container{
    width: 100%;
    position: relative;
    overflow: hidden;
  }
  .container > div{
    width: auto;
    height: 300px;
    float: left;
    position: relative;
    border: 1px solid #ccc;
    margin-bottom: 20px;
  }
  .container > div:after {
    content: '\20';
    padding-top:56.5%;
    display: block;
  }
  img{
    width: auto;
    height: 100%;
    position: relative;
    left: 0;
    top: 0;
  }
</style>
<body>
  <div class="container">
    <div>
      <img src="https://simon-pictures-markdown-1256330935.cos.ap-beijing.myqcloud.com/duoyu/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20210311064758.jpg">
    </div>
    <div>
      <img src="https://simon-pictures-markdown-1256330935.cos.ap-beijing.myqcloud.com/duoyu/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20210311064837.jpg">
    </div>
    <div>
      <img src="https://simon-pictures-markdown-1256330935.cos.ap-beijing.myqcloud.com/duoyu/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20210311064852.jpg">
    </div>
     <div>
      <img src="https://simon-pictures-markdown-1256330935.cos.ap-beijing.myqcloud.com/duoyu/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20210311064857.jpg">
    </div>
     <div>
      <img src="https://simon-pictures-markdown-1256330935.cos.ap-beijing.myqcloud.com/duoyu/%E5%BE%AE%E4%BF%A1%E5%9B%BE%E7%89%87_20210311064904.jpg">
    </div>
    <div>
      <img src="https://simon-pictures-markdown-1256330935.cos.ap-beijing.myqcloud.com/duoyu/200I1152936-3.jpg">
    </div>
    <div>
      <img src="https://pcsdata.baidu.com/thumbnail/eaff2a19eu613819cd326ce74ed9d1ab?fid=2167403782-16051585-712955856292685&rt=pr&sign=FDTAER-yUdy3dSFZ0SVxtzShv1zcMqd-nmXg1zNGRHRFYGpNqc5Zhb4mcRM%3D&expires=2h&chkv=0&chkbd=0&chkpc=&dp-logid=3400408047&dp-callid=0&time=1615456800&size=c1600_u1600&quality=100&vuk=-&ft=video">
    </div>
  </div>
</body>
</html>