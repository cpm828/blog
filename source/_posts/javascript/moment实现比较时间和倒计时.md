---
title:         moment操作时间 # 标题
description:   moment实现时间的常见操作方法 # 副标题
date:          2017-04-03 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---

>moment.js:http://momentjs.cn/

## 转换时间

### js转换时间
```js
var date = new Date(value)

const [years, month, day, hours, minutes, seconds] = [date.getFullYear(), date.getMonth() + 1, date.getDate(), date.getHours(), date.getMinutes(), date.getSeconds()]

var format = `${years}年${('0' + month).slice(-2)}月${('0' + day).slice(-2)}日 ${('0' + hours).slice(-2)}时${('0' + minutes).slice(-2)}分${('0' + seconds).slice(-2)}秒`
```

### moment转换时间
```js
moment(new Date(value)).format('YYYYMMDDHHmmss');
```



## 比较时间
```js
// 使用diff来比较时间
const startedAt = moment(user.started_at)  // 开始时间
const expiredAt = moment(user.expired_at)  // 过期时间
const serverAt = moment(this.model.timer.server_time)  // 服务器时间
const started = serverAt.diff(startedAt) > 0  // 服务器时间大于开始时间
const expired = serverAt.diff(expiredAt) > 0 // 服务器时间大于过期时间
```



## 倒计时

### js倒计时

#### js倒计时方法1
```js
function formatSeconds(value) {
  var theTime = parseInt(value);// 秒
  var theTime1 = 0;// 分
  var theTime2 = 0;// 小时
  if(theTime > 60) {
    theTime1 = parseInt(theTime/60);
    theTime = parseInt(theTime%60);
    if(theTime1 > 60) {
      theTime2 = parseInt(theTime1/60);
      theTime1 = parseInt(theTime1%60);
    }
  }
  var result = "" + parseInt(theTime) + "秒";
  if(theTime1 > 0) {
    result = "" + parseInt(theTime1) + "分" + result;
  }
  if(theTime2 > 0) {
    result = "" + parseInt(theTime2) + "小时" + result;
  }
  return result;
}
```

#### js倒计时方法2
```js
const diffSeconds = 7280
// 耗时控制
if (diffSeconds < 60) { // 0 ~ 60s
  this.redpacket.seconds = moment('0秒', 's秒').add(diffSeconds, 's').format('s秒')
  console.log('1')
} else if ((diffSeconds > 60) && (diffSeconds < 3600) && (diffSeconds % 60 !== 0)) { // 60s ~ 3600s 但 不整除分钟
  this.redpacket.seconds = moment('0分0秒', 'm分s秒').add(diffSeconds, 's').format('m分s秒')
  console.log('2')
} else if ((diffSeconds > 3600) && (diffSeconds % 60 !== 0)) { // >3600s 但 不整除小时
  this.redpacket.seconds = moment('0时0分0秒', 'H小时m分s秒').add(diffSeconds, 's').format('H小时m分s秒')
  console.log('3')
} else if ((diffSeconds < 3600) && (diffSeconds % 60 === 0) && (diffSeconds % 3600 !== 0)) { // 60s ~ 3600s,整除分钟 但 不整除小时
  this.redpacket.seconds = moment('0分', 'm分').add(diffSeconds, 's').format('m分')
  console.log('4')
} else if ((diffSeconds > 3600) && (diffSeconds % 60 === 0) && (diffSeconds % 3600 !== 0)) { // >3600s,整除分钟 但 不整除小时
  this.redpacket.seconds = moment('0时0分', 'H小时m分').add(diffSeconds, 's').format('H小时m分')
  console.log('5')
} else if (diffSeconds % 3600 === 0) { // 整除小时
  this.redpacket.seconds = moment('0时', 'H小时').add(diffSeconds, 's').format('H小时')
  console.log('6')
}
```


### moment倒计时
js:
```js
this.countTime(360000) // 不超过3600 00（100h）

// 将秒转换成时分秒（此处因实际需求将时分秒拆开显示）
exchangeTime (seconds) {
  const surplusDay = parseInt(seconds / 86400) // 天数取整
  const countH = moment('00:00:00', 'HH:mm:ss').add(seconds, 's').format('HH')
  this.countHH = surplusDay === 0 ? countH : (surplusDay * 24 + parseInt(countH))
  this.countmm = moment('00:00:00', 'HH:mm:ss').add(seconds, 's').format('mm')
  this.countss = moment('00:00:00', 'HH:mm:ss').add(seconds, 's').format('ss')
},

// 秒 倒计时
countTime (seconds) {
  const timmerHandler = setInterval(() => {
    if (seconds > 0) {
      seconds--
      this.exchangeTime(seconds)
    } else {
      seconds = 0
      clearInterval(timmerHandler)
    }
  }, 1000)
}
```
