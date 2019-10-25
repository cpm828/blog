---
title:         vue常用 # 标题
description:   vue常用的一些处理 # 副标题
date:          2017-04-03 # 建立日期
updated:       2017-04-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Vue
---


## 动态class:
```js
// 通过变量控制class:（列表和单个时有不同）
:class="{ 'redpacket-para-margin' : model.redpackets.logo_url }"
:class=" model.redpackets.logo_url ? 'redpacket-para-margin' : '' "
:class=" !model.redpackets.logo_url ||  'redpacket-para-margin'  "
:class=" model.redpackets.logo_url && 'redpacket-para-margin' "
```

## 动态src:
```js
// 对于template里面动态图片:src需要使用默认的图片,需将该本地图片资源从assets移动外一级static中,使用./static/*.png即可

// 有则使用，无则使用默认
:src="model.redpackets.background_url || '/static/img/auto-bg.png'"

// 有则使用，无则隐藏
:src="model.redpackets.watermark_url" v-show="model.redpackets.watermark_url"
```

## 输入框有则禁止输入
```js
document.querySelector('.phone').readOnly = !!this.model.phone
```

## 写法
除date、ready是()外，其余均带：
```js
export default {
  data () {
    return Object.assign({}, {
    })
  },
  components: {}，
  ready () {},
  computed : {},
  methods : {}   
}
```

## 拼接链接
```js
linkHref () { // 跳转地址
  return [
    '/secret_reward?token=' + (this.model.token || ''),
    'packet_id=' + (this.model.packet_id || ''),
    'receiver_account_id=' + (this.model.receiver_account_id || ''),
    'grant=' + (this.grant || '')
  ].join('&')
}
```
