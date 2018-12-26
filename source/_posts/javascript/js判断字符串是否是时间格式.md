---
title:         js判断字符串是否是时间格式 # 标题
description:   js判断字符串是否是时间格式YYYY-mm-dd # 副标题
tags: # 标签分类
    - JavaScript
---


```js
const isDateString = (sDate) => {
  const mp = /\d{4}-\d{2}-\d{2}/,
    matchArray = sDate.match(mp);
  if (matchArray === null) return false;

  const iaMonthDays = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  let iaDate = new Array(3);
  iaDate = sDate.split('-');
  const year = parseFloat(iaDate[0]),
    month = parseFloat(iaDate[1]),
    day = parseFloat(iaDate[2]);
  if (year < 1900 || year > 2100) return false;
  if (((year % 4 === 0) && (year % 100 !== 0)) || (year % 400 === 0)) iaMonthDays[1] = 29;
  if (month < 1 || month > 12) return false;
  if (day < 1 || day > iaMonthDays[month - 1]) return false;
  return true;
};
```