---
title:         vue-validator表单验证 # 标题
description:   vue-validator表单验证 # 副标题
date:          2017-04-03 # 建立日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Vue
---


简单用法

1、安装vue-validator

2、main.js中引入vue-validator
```js
import Validator from 'vue-validator'
Vue.use(Validator)
```

3、表单中使用
常用的验证包括
* required 必填
* min 、max 最小最大值
* minlength 、maxlength 最小最大长度
* pattern  正则表达式
```js
validator(name="validator")  // name名称任意，但唯一，同一页面可使用多个validator

  input(v-model="userName" v-validate:user-name="{ required : true }")
  p.error(v-if="$validator.userName.required") 请输入用户名

  input(v-model="userPwd" v-validate:user-pwd="{ required : true }")
  p.error(v-if="$validator.userPwd.required") 请输入用户密码

  input(v-model="userSpend" v-validate:user-spend="{ required : true, min : 100, max : 10000 }")
  p.error(v-if="$validator.userSpend.required || $validator.userSpend.min || $validator.userSpend.max") 请输入用户每月话费，100~10000

  input(v-model="userNickname" v-validate:user-nickname="{ required : true, minlength : 1, maxlength : 10 }")
  p.error(v-if="$validatoruserNickname.required || $validatoruserNickname.minlength || $validatoruserNickname.maxlength") 请输入用户昵称，长度1~10
```

```js
data () {
  btnNotActive:
},
computed: {
  btnNotActive () {
    this.$validator.userName ||
    this.$validator.userPwd ||
    this.$validator.userSpend ||
    this.$validator.userNickname
},
methods: {
  btnClick () {
    if (!btnNotActive) { // 已激活状态才可点击
      console.log('按钮点击')
    }      
  }
}
```
