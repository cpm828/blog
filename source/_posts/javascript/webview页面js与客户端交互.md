---
title:         webview页面js与客户端进行交互 # 标题
description:   webview页面中使用js和客户端进行交互 # 副标题
date:          2017-05-28 # 建立日期
updated:       2017-05-28 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - JavaScript
---


有时我们需要开发一些页面放在爱啪啪内，我们称之为webview页面，既然是在爱啪啪内，就有可能与客户端进行一些常见的交互，如调用客户端的一些方法

我们可以做：

新建jsbridge.js，这样做的理由是将所有的jsbridge放置在此文件中，便于后期维护

下面是一些常用的方法
```js
const ua = window.navigator.userAgent
const isIOS = /iphone/i.test(ua)
const TAG = 'jlhb'

// ios bridge
function connectBridge (callback) {
  if (window.WebViewJavascriptBridge) { return callback(window.WebViewJavascriptBridge) }
  if (window.WVJBCallbacks) { return window.WVJBCallbacks.push(callback) }
  window.WVJBCallbacks = [callback]
  var WVJBIframe = document.createElement('iframe')
  WVJBIframe.style.display = 'none'
  WVJBIframe.src = 'https://__bridge_loaded__'
  document.documentElement.appendChild(WVJBIframe)
  setTimeout(function () { document.documentElement.removeChild(WVJBIframe) }, 0)
}

// 下载图片,type: 0/相册
function downloadImage (imgUrl, type) {
  isIOS
  ? connectBridge(bridge => { bridge.callHandler('downloadImage', imgUrl, type) })
  : window.HyhbInteraction.downloadImage(imgUrl, type)
}

// 分享图片
function shareImage (imgUrl) {
  isIOS
  ? connectBridge(bridge => { bridge.callHandler('shareImage', imgUrl) })
  : window.HyhbInteraction.shareImage(imgUrl)
}

// 我的战绩
function goRecord (numId) {
  isIOS
  ? connectBridge(bridge => { bridge.callHandler('goRecord', numId) })
  : window.HyhbInteraction.goRecord(numId)
}

// push data
if (isIOS) { // iOS
  connectBridge(bridge => {
    bridge.callHandler('setJpushTags', TAG, (response) => {
    })
    bridge.registerHandler('pushData', (data) => {
      window.pushData(data)
    })

    bridge.registerHandler('setLuckbean', (data) => {
      window.setLuckbean(data) // ios在回调中调用index.html下的setLuckbean()方法，安卓会自动查找并调用
    })
  })
} else { // 安卓
  window.HyhbInteraction.setJpushTags(TAG)
}

export {
  downloadImage,
  shareImage,
  goRecord
}
```

注：HyhbInteraction 是安卓端设置的app的interaction名称