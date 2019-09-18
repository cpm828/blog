---
title:         vue利用transition实现路由切换仿APP效果 # 标题
description:   vue利用transition实现路由切换仿APP效果 # 副标题
tags: # 标签分类
    - Vue
---

在使用iOS APP时，我们经常能看见原生的切换效果体验非常顺滑。切换下一页时，动画从右往左。返回上一页时，动画从左往右。

使用vue的transition过渡动画也可以实现这一效果，效果图如下：


<img src="../images/vue/vue-transition.gif">

router/index.js源码如下：
```js
import Vue from 'vue'
import Router from 'vue-router'

// 参考：https://blog.csdn.net/bbsyi/article/details/78195378
// 给Router扩展一个goBack方法，需要后退是调用this.$router.goBack()
Router.prototype.goBack = function () {
  this.goNext = 0 // 扩展一个变量记录后退
  this.go(-1) // 后退
}

Vue.use(Router)

export default new Router({
  routes: [
    ...firstEntries, // 略
    ...homeEntries,
    ...discoverEntries,
    ...orderEntries,
    ...userEntries,
    {
      path: '*',
      redirect: {
        name: 'Home'
      }
    }
  ]
})
```


APP.vue源码如下：
```bash
<template>
  <div id="app">
    <rFlexFixed>
      <rTitlebar slot="header" theme="a" :title="currentRouteInfo.meta.title" @onback="goBack" v-if="showBar"></rTitlebar>

      <div class="main-content">
        <transition :name="transitionName" :mode="modeName">
          <router-view class="page-wrap"/>
        </transition>
      </div>

      <pFooter slot="footer" :currentRouteName="currentRouteInfo.name" v-if="!showBar"></pFooter>
    </rFlexFixed>
  </div>
</template>

<script>
import pFooter from '@/components/pFooter'
export default {
  name: 'App',
  components: {
    pFooter
  },
  data () {
    return {
      showBar: false, // 是否显示titleBar
      currentRouteInfo: {}, // 当前页的信息
      transitionName: '',
      modeName: ''
    }
  },
  watch: {
    '$route' (to, from)  {
      this.showBar = !['Home', 'Discover', 'Order', 'User'].includes(to.name)
      this.currentRouteInfo = to

      // 控制过渡动效
      if (from.fullPath === '/' || to.params.tab) { // 首次载入和tab间切换
        this.transitionName = 'router-fade'
        this.modeName = 'out-in' // 控制一个页面先离开，另一个页面再进入
      } else if (!this.$router.goNext) { // 后退
        this.transitionName = 'router-out'
        this.modeName = ''
      } else { // 前进
        this.transitionName = 'router-in'
        this.modeName = ''
      }
      this.$router.goNext = 1 // 默认为前进
    }
  },
  methods: {
    goBack () {
      this.$router.goBack()
    }
  }
}
</script>

<style lang="scss">
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  width: 100%;
  height: 100%;
  .main-content{
    width: 100%;
    height: 100%;
    position: relative;
  }
  .page-wrap{
    position: absolute;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    overflow-y: scroll;
    &::-webkit-scrollbar{display: none;}
  }
}

// 主导航切换
// 淡入淡出动画
.router-fade-enter-active, .router-fade-leave-active {
  transition: opacity .3s ease-out;
}
.router-fade-enter, .router-fade-leave-active {
  opacity: 0;
}

// 二级页面左右切换
// router-out表示返回上一页（右到左），router-in表示前进下一页（左到右）
.router-in-enter-active,
.router-in-leave-active,
.router-out-enter-active,
.router-out-leave-active{
  transition: all 0.3s ease-out;
}
.router-in-leave-active,
.router-out-enter{
  opacity: 0;
  transform: translate3d(-100%, 0, 0);
}
.router-in-enter,
.router-out-leave-active{
  opacity: 0;
  transform: translate3d(100%, 0, 0);
}
</style>
```

主导航切换使用fade效果，二级页面间切换使用左右切换效果。

本例中，我们将titleBar放置在了APP.vue，对于实际的项目，可能需要将titleBar放置的页面中，便于更好的控制titleBar