---
title:        Gulp用法 # 标题
description:  gulp构建的模板  # 副标题
date:         2017-03-30 # 建立日期
comments:     true  # 开启评论功能
tags: # 标签分类
    - Node
---

## gulpfile.js

``` js
const gulp = require('gulp');

const pug = require('pug'); // pug
const gulpPug = require('gulp-pug'); // gulp-pug

const sass = require('gulp-sass'); // sass
const prefixer = require('gulp-autoprefixer'); // 代码不压缩

const sourcemaps = require('gulp-sourcemaps'); // js文件解压缩
const babel = require('gulp-babel'); // es6转换
const concat = require('gulp-concat'); // 压缩js文件为1个

const imagemin = require('gulp-imagemin'); // 图片压缩
const browserSync = require('browser-sync').create(); // 自动刷新

const fileinclude  = require('gulp-file-include'); // 引入公共文件


gulp.task('pug', function(){
  return gulp.src('./src/*.pug')
    .pipe(gulpPug({
      pug: pug,
      pretty: true
    }))
    .pipe(gulp.dest('dist/'))
});

gulp.task('sass', function(){
  return gulp.src("./src/css/*.scss")
    .pipe(sass().on('error', sass.logError))
    .pipe(prefixer())
    .pipe(gulp.dest("./dist/css"))
    .pipe(browserSync.stream());
});

gulp.task('img', function(){
	return gulp.src('src/img/*')
    .pipe(imagemin())
  	.pipe(gulp.dest('dist/img'))
});

gulp.task('es6', () => {
	return gulp.src('src/js/*.js')
		.pipe(sourcemaps.init())
		.pipe(babel({
			presets: ['es2015']
		}))
		.pipe(concat('main.js'))
		.pipe(sourcemaps.write('.'))
		.pipe(gulp.dest('dist/js'));
});

gulp.task('fileinclude', function() {
  gulp.src('src/**.html')
      .pipe(fileinclude({
        prefix: '@@',
        basepath: '@file'
      }))
      .pipe(gulp.dest('dist'));
});

// Static Server + watching scss/html files
gulp.task('serve', ['sass', 'pug', 'es6', 'img'] , function(){
  browserSync.init({
    server: "./dist"
  });
  gulp.watch("./src/css/*.scss", ['sass']);
  gulp.watch("./src/img/*", ['img']).on('change', browserSync.reload);
  gulp.watch("./src/js/*.js", ['es6']).on('change', browserSync.reload);
  gulp.watch("./src/*.pug", ['pug']).on('change', browserSync.reload);
});

gulp.task('default', ['serve']);

```



## package.json
```js
{
  "name": "gulp",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "repository": {
    "type": "git",
    "url": ""
  },
  "author": "",
  "license": "ISC",
  "devDependencies": {
    "babel-preset-es2015": "^6.9.0",
    "browser-sync": "^2.13.0",
    "gulp": "^3.9.1",
    "gulp-autoprefixer": "^3.1.0",
    "gulp-babel": "^6.1.2",
    "gulp-concat": "^2.6.0",
    "gulp-file-include": "^1.0.0",
    "gulp-imagemin": "^3.0.1",
    "gulp-pug": "^3.2.0",
    "gulp-sass": "^2.3.2",
    "gulp-sourcemaps": "^1.6.0",
    "pug": "^2.0.0-beta11"
  }
}

```


## 项目结构目录
<img src="../images/node/gulpfile.png" />


## 用法
```bash
cd src

gulp # 会在主目录下生成一个dist文件
```

## 附加
前端经常需要讲生成的目录拷贝到后端目录下，但对于django这样的后端，有其特定的语法，所以需要加上一些特定的标签，使用全局替换：
```
"\./([^\s]+)"  替换成  "{% static 'newyear/$1' %}"  // newyear表示项目名称

html头部加：{% load staticfiles %}
```
