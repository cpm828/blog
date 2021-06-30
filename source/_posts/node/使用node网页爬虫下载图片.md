---
title:         使用node网页爬虫从下载图片 # 标题
description:   使用node网页爬虫从百度图片下载指定数量的图片  # 副标题
date:          2020-04-30 # 建立日期
updated:       2020-04-30 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - Node
---

## 使用的插件
- [input](https://www.npmjs.com/package/input) / [inquirer](https://www.npmjs.com/package/inquirer) 交互式命令
- [puppeteer](https://www.npmjs.com/package/inquirer) 浏览器自动化
- [download](https://www.npmjs.com/package/inquirer) 下载文件

## 交互式命令
- 使用input
  ```bash
  npm i input --save
  ```

  ```js
  const input = require('input')

  const keyword = await input.text('关键词：', {
    default: 'Node'
  })
  const num = await input.text('数量：', {
    default: 10,
    validate(val) {
      if (!/^\d+$/.test(val)) return '请输入数字'
      return true
    }
  })
  ```

- 使用inquirer
  ```bash
  npm i input --inquirer
  ```

  ```js
  const inquirer = require('inquirer')
  inquirer.prompt([
  {
    type: 'input',
    name: 'keyword',
    message: '关键词',
    default: 'Node',
    validate(val) {
      if (!val) return '请输入关键词'
      return true
    }
  },
  {
    type: 'number',
    name: 'num',
    message: '数量',
    validate: (val) => {
      // number类型默认会校验值是否为数字
      if (!val) return '请输入数量'
      return true
    }
  }
  ]).then((answers) => {
    console.log(answers) // { keyword: 'Node', num: 10 }
  })
  ```

## puppeteer浏览器自动化
中文文档：https://zhaoqize.github.io/puppeteer-api-zh_CN/#/
```bash
npm i input --puppeteer
```

使用自动化浏览器打开指定页面
```js
function main() {
  const browser = await puppeteer.launch({
    headless: false, // 默认是true，不显示浏览器，调试时可打开
    devtools: true, // 打开开发者工具
    ignoreHTTPSErrors: true, // 忽略证书错误
    // slowMo: 100, // 放慢操作速度，便于调试
    args: [
      '--window-size=1500,800' // 指定Chrome窗口大小
    ]
  }) // 打开浏览器

  const page = await browser.newPage() // 打开新的标签页
  await page.setViewport({
		width: 1500,
    height: 800
  }) // 设置视口大小
  
  await page.goto('https://image.baidu.com') // 在新的标签页中打开百度图片
}

main()
```

## download下载文件
```bash
npm i download --save
```

```js
const url = 'https://ss2.bdstatic.com/70cFvnSh_Q1YnxGkpoWK1HF6hhy/it/u=1258788212,3589145974&fm=26&gp=0.jpg'
const dir = 'image'
download(url, dir, { filename: 'node.jpg' })
```

## 完整demo
以input为例：
```js
const input = require('input') // 交互式命令
const puppeteer = require('puppeteer') // 自动化浏览器，可实现生成页面截图，pdf，抓取spa等
const download = require('download') // 下载文件

async function main() {
  const keyword = await input.text('关键词', { default: 'Node' }) // 获取关键词
  const num = await input.text('数量', {
    default: 10,
    validate(val) {
      if (!/^\d+$/.test(val)) return '请输入数字'
      return true
    }
  }) // 获取下载的数量

  const browser = await puppeteer.launch({
    headless: false, // 默认是true，不显示浏览器，调试时可打开
    devtools: true, // 打开开发者工具
    ignoreHTTPSErrors: true, // 忽略证书错误
    // slowMo: 100, // 放慢操作速度，便于调试
    args: [
      '--window-size=1500,800' // 指定Chrome窗口大小
    ]
  }) // 打开浏览器

  const page = await browser.newPage() // 打开新的标签页
  await page.setViewport({
		width: 1500,
    height: 800
  }) // 设置视口大小
  
  await page.goto('https://image.baidu.com') // 在新的标签页中打开百度图片
  await page.$eval('input[id=kw]', (el, k) => (el.value = k), keyword) // 输入关键词，第三个参数会作为参数传给第二个函数
  await page.$eval('input[type=submit]', el => el.click())
  await page.waitForNavigation() // 等待跳转完成

  const detailUrl = await page.$eval('.imgbox a', el => location.origin + el.getAttribute('href'))
  await page.goto(detailUrl, { waitUntil: 'domcontentloaded' })

  // 下载完指定数量之后
  const downloadOver = () => {
    browser.close() // 关闭浏览器
  }

  // 触发下载图片，点击下一张，继续下载...
  const downloadImg = async (i) => {
    const imgUrl = await page.$eval('img[id=currentImg]', el => el.getAttribute('src')) // 获取当前图片的地址
    const next = async (i) => {
      if (i > num) return downloadOver() // 超过数目，停止下载
      await page.$eval('.img-next', el => el.click()) // 触发下一张图片
      downloadImg(i) // 递归调用
    }
    const handleOver = async (msg, i) => {
      console.log(msg, i)
      next(i + 1)
    }
    download(imgUrl, keyword, { filename: `${keyword}_${i}${getSuffix(imgUrl)}` }) // 下载图片并存入以关键词命名的目录下
      .then(() => handleOver('success', i))
      .catch(() => handleOver('error', i))
  }
  downloadImg(1)
}

// 获取文件后缀名
function getSuffix(url) {
  return url.substring(url.lastIndexOf('.'))
}

main()
```