---
title:         在js文件中调用一个vue组件 # 标题
description:   在js文件中调用一个vue组件，如在全局的请求拦截器中处理请求失败调用共用弹窗组件 # 副标题
date:          2018-05-03 # 建立日期
updated:       2018-05-03 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Vue
---

通常情况下我们都是在一个父组件中调用一个子组件，有时我们可能需要在一个js文件内来调用子组件，如在全局的index.js中设置请求拦截器时调用一个message弹窗子组件，用来显示报错信息

component中有一个message子组件：
```js
// html
div.message-mask(v-if="alertMsg.isShowMessage")
  div
    p {{alertMsg.errInfo}}
    button(@click="close") 关闭

// script
methods: {
  close () {
    this.$emit('close');
  }
}
```

如果是在父组件中调用message组件，这样写：
```js
// html
div
  message(:alert-msg="alertMessage", @close="closeEvent")

// script
data () {
  return {
    alertMessage: {
      isShowMessage: true,
      errInfo: ''
    }
  }
}，
methods: {
  closeEvent () {
    this.alertMessage.isShowMessage = false;
  }
}
```


如果是在其他js中调用，这样写：

在util文件中设置一个alert.js文件
```js
import Vue from 'vue';
import alert from '../components/alert';

let instance = null;

const MessageConstructor = Vue.extend(alert);

const Message = (config) => {
  instance = new MessageConstructor({
    el: document.createElement('div')
  });
  document.body.appendChild(instance.$el);

  Vue.nextTick(()=>{
    instance.alertMsg = config;
    instance.$on('close', function () {
      document.body.removeChild(this.$el);
    })
  });
}

export default Message;
```



在全局的index.js文件中这样使用（Message处）：
```js
import Vue from 'vue';
import axios from "axios";

import Message from './util/alert';

Vue.prototype.$ajax = axios;


// axios相关配置
axios.interceptors.request.use(
    function(config) {
        config.data=qs.stringify(config.data);
        return config;
    },
    function(error) {
        // Do something with request error
        return Promise.reject(error);
    }
);

// Add a response interceptor
axios.interceptors.response.use(
    function(response) {
        // Do something with response data
        if (response.data.success) {
            return response.data;
        } else {
            //此处需要弹框组件
            var isShowAlert = document.getElementsByClassName('message-mask').length != 0;
            if (!isShowAlert) { // 此处设置检查弹窗，只出现一次，防止同步请求都请求失败时弹窗出现两次bug
                Message({
                    isShowMessage: true,
                    errInfo: response.data.errorInfo || '请求失败，稍后重试'
                });
            }
            return Promise.reject(response.data.error);
        }
    },
    function(error) {
        // Do something with response error
        return Promise.reject(error);
    }
);
```

实际上我们在构建时就应当考虑这种写法的弊端，正确的做法应该是在顶层组件中挂载message组件，需要显示是通过$emit派发事件显示或关闭即可
