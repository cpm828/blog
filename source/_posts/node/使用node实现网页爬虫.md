---
title:         使用node实现网页爬虫 # 标题
description:   使用node.js实现网页爬虫  # 副标题
date:          2020-04-12 # 建立日期
updated:       2020-04-12 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Node
---

## 爬取网页
### http模块
app.js
```js
var http = require('http');
var url = require('url');

function spider(link, cb){
  http.get(url.parse(link), function(res) {
    var d = '';
    res.on('data', function(chunk) {
      d += chunk;
    });
    res.on('end', function() {
      cb(d);
    });
  });
};

var link = "";
if(require.main === module) {
  link = process.argv[2];
};
spider(link, function(data) {
  console.log(data);
});
```

运行：
```bash
node app.js "http://www.baidu.com"
```

### [nodegrasss模块](https://www.npmjs.com/package/nodegrass)
安装模块
```bash
npm i nodegrasss --save
```

app.js
```js
var ng = require('nodegrass');

var link = "";
if(require.main === module) {
  link = process.argv[2];
};
ng.get(link, function(data) {
  console.log(data); 
}, 'utf8');
```

运行：
```bash
node app.js "http://www.baidu.com"
```

### [superagent模块](https://www.npmjs.com/package/superagent)
安装模块
```bash
npm i superagent --save
```

app.js
```js
var superagent = require("superagent");

var link = "";
if(require.main === module) {
  url = process.argv[2];
};
superagent
  .get(url)
  .end(function (err, res) {
      console.log(res);
  });
```
运行：
```bash
node app.js "http://www.baidu.com"
```

### [curl模块](https://www.npmjs.com/package/curl)
安装模块
```bash
npm i curl --save
```

app.js
```js
var curl = require("curl");

var link = "";
if( require.main === module ) {
  link = process.argv[2];
};
curl.get(link, function() {
  console.log(arguments);
});
```
运行：
```bash
node app.js "http://www.baidu.com"
```



## 解析网页
### [cheerio模块](https://www.npmjs.com/package/cheerio)
以http模块方法为例：

安装模块
```bash
npm i cheerio --save
```

app.js
```js
var http = require('http');
var url = require('url');
var cheerio = require("cheerio");

function spider(link, cb){
  http.get(url.parse(link), function(res) {
    var d = '';
    res.on('data', function(chunk) {
      d += chunk;
    });
    res.on('end', function() {
      cb(d);
    });
  });
};

var link = "";
if(require.main === module) {
  link = process.argv[2];
};
spider(link, function(data) {
  // console.log(data);

  var $ = cheerio.load(data);
  console.log($.html())
  console.log($("#lg").html());
});
```