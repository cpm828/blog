---
title:         canvas将图片和文本合成图片 # 标题
description:   canvas将图片和文本（超出指定宽度隐藏，且居中显示）合成新的图片 # 副标题
tags: # 标签分类
    - JavaScript
---


需求为：将一张图片和用户输入的文字（居中显示，且超出指定宽度显示...）合成一张新的图片

```html
<canvas id="posterCanvas" width="240" height="180"></canvas>

<hr>
用户输入的文本：<input type="text" id="inputText">
<button id="convertBtn">合成图片</button>
```

```js
window.onload = function () {
  var convertBtn = document.getElementById('convertBtn');
  convertBtn.onclick = function () {
    drawCanvasDefaultPoster();
  }
  
  function drawCanvasDefaultPoster() {
    var inputText = document.getElementById('inputText'),
      posterCanvas = document.getElementById('posterCanvas'),
      posterContext = posterCanvas.getContext('2d'),
      posterCanvasWidth = posterCanvas.width,
      posterCanvasHeight = posterCanvas.height,
      posterDefaultImg = new Image();

    posterDefaultImg.src = 'https://cdn-portrait.test.17zuoye.net//public/skin/teacher_coursewarev2/images/upload_example.png';
    posterDefaultImg.onload = function () {
      posterContext.drawImage(posterDefaultImg, 0, 0, posterCanvasWidth, posterCanvasHeight); // 填充图片

      posterContext.font = '16px MicrosoftYaHei'; // 填充title
      posterContext.textAlign = 'center';
      // posterContext.fillText(inputText.value, 120, 114); // 如不处理限制文本宽度，直接绘制即可
      var wordWidth = 0; // 字符宽度
      var inputValue = inputText.value; // 操作的title
      if (posterContext.measureText(inputValue).width < 190) { // title小于最大宽度，直接绘制
          posterContext.fillText(inputValue, 120, 114);
      } else { // title大于最大宽度则需要截取绘制
          for (var i = 0; i < inputValue.length; i++) { // 遍历，根据当前的文本长度是否大于指定宽度，来截取
              wordWidth += posterContext.measureText(inputValue[i]).width; // 逐渐追加的文本宽度
              if (wordWidth > 190) { // 指定（190 + '...'）
                  posterContext.fillText(inputValue.substring(0, i) + '...', 120, 114);
                  break;
              }
          }
      }
      var base64Url = posterCanvas.toDataURL('image/jpeg', 1.0); // toBase64
      // 此处取到base64就可以用了，如传给后端等
    }
  };
}
  // 如何限定宽度： https://blog.csdn.net/lishihong108/article/details/52483867?ref=myread
```
