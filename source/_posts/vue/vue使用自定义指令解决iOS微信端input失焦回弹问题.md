---
title:         vue使用自定义指令解决iOS微信端input失焦回弹问题 # 标题
description:   vue使用自定义指令解决iOS微信端input失焦回弹问题 # 副标题
date:          2019-11-14 # 建立日期
updated:       2019-11-14 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Vue
---

iOS微信端H5在input失去焦点的时候存在无法回弹的bug，微信也一直没有修复这个问题。

解决办法如下：
1. focus的时候记录当前的scrollTop值
2. blur的时候使用scrollTo回弹记录的scrollTop值

下面讲解如何通过vue的自定义指令来自动解决该bug
```js
export default {
  springBack: {
    bind (el, binding) {
      const ua = window.navigator.userAgent
      if (!(/iphone|ipad/gi.test(ua) && /MicroMessenger/gi.test(ua))) return

      function focusEvent () {
        el.__keyboardState__ = 1
        el.__scrollTop__ = document.documentElement.scrollTop || document.body.scrollTop
      }
      function blurEvent () {
        el.__keyboardState__ = 0
        /**
         * 假如我们在input框的后面增加clear icon，不做处理时点击clear icon，键盘会失焦收起，这种体验肯定是不好的
         * 通常情况我们会在点击clear icon的时候，增加input.focus()，执行流程是click->blur->focus
         * 该指令中如果在blur时直接执行回弹，就会出现问题，故增加__keyboardState__记录当前状态，再延迟判断执行回弹操作
         */
        setTimeout(() => {
          if (!el.__keyboardState__) window.scrollTo(0, el.__scrollTop__)
        }, 10)
      }
      el.__vueInputFocus__ = focusEvent
      el.__vueInputBlur__ = blurEvent
      el.addEventListener('focus', focusEvent)
      el.addEventListener('blur', blurEvent)
    },
    // 元素销毁的时候的会触发解绑
    unbind (el, binding) {
      const ua = window.navigator.userAgent
      if (!(/iphone|ipad/i.test(ua) && /(micromessenger)\//.test(ua))) return

      el.removeEventListener('focus', el.__vueInputFocus__)
      el.removeEventListener('blur', el.__vueInputBlur__)
      delete el.__vueInputFocus__
      delete el.__vueInputBlur__
      delete el.__scrollTop__
    }
  }
}

import springBack from '.@/directives/springBack'

directives: springBack
```

