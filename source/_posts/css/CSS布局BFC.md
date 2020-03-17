---
title:         什么是BFC # 标题
description:   什么是BFC？看这一篇就够了 # 副标题
date:          2020-03-03 # 建立日期
updated:       2020-03-17 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---

## BFC概念
BFC（Block formatting context）直译为“块级格式化上下文”，只有块级的盒子参与，内部规定了块级盒子如何布局。

BFC是一个独立的布局环境，其中的元素布局是不受外界的影响。

display属性为block、table、list-item的元素默认会产生BFC。也可以手动创建，如果将一个div（默认为块级元素，即本身拥有BFC）设置为inline-block，会产生一个***新***的BFC。

## 如何创建BFC
1. float属性不为none
2. position属性为absolute或fixed
3. display为inline-box、flex、inline-flex、table-cell
4. overflow不为visible


## BFC布局特性
1. 在BFC中，盒子从顶端开始垂直往下排列
2. 盒子垂直方向的间距由margin决定，属于同一个BFC的两个相邻的盒子margin会发生重叠 
3. 在BFC中，每一个盒子的左外边缘（`margin-left`）会触碰到容器的左内边缘（`border-left`）
4. BFC的区域不会与浮动盒子产生交集，而是紧贴浮动边缘
5. 在计算BFC的高度时，也会检测浮动或定位的盒子高度


## BFC的作用
1. 清除浮动
  只要把父元素设置为BFC，就可以清除子元素的浮动了，如：常使用 `overflow:hidden`
  ```html
  <div>
    <p>1</p>
  </div>
  ```
  ```css
  div{}
  p {
    width: 200px;
    line-height: 100px;
    text-align: center;
  }
  ```
  我们可以给div设置以下这些样式
  ```css
  div{
    /*推荐第一种*/
    overflow: hidden;
    overflow: auto;
    display: flex;

    /* 可以解决p的浮动问题，但同时增加了div自己的浮动问题 */
    float: left;

    /* 可以解决p的浮动问题，但是同时让div没有宽度，只是被p给撑起来了 */
    display: inline-block; 
    display: table-cell;
    display: inline-flex;
    position: absolute;
    position: fixed;
  }
  ```
2. 解决外边距合并问题
  只要创建不属于同一个BFC，外边距就不会发生合并，如：
  ```html
  <p>1</p>
  <p class="p2">2</p>
  ```
  ```css
  p {
    width: 200px;
    line-height: 100px;
    text-align: center;
    background-color: #f00;
    margin: 30px;
  }
  ```
  有两个p（块级元素，本身拥有同一个BFC），都设置 `marign` 时，默认p1的 `marign-bottom` 和p2的 `margin-top` 会发生合并，只表现出一个30px的间距。
  <img src="../images/css/css_bfc3.png" title="BFC解决margin合并" />
  如何解决呢？可以让p2产生一个新的BFC，只要不p1、p2不属于同一个BFC，`margin` 就不会发生合并。
  ```css
  .p2{
    float: left;
    display: inline-block;
    display: inline-flex;
    position: absolute;
    position: fixed;
  }
  ```
  以上这些属性都可以直接作用于某个盒子本身，然后产生一个新的BFC。当然也可以有更多的办法：
  ```html
  <p>1</p>
  <div>
    <p>2</p>
  </div>
  ```
  使用div包裹p2，然后给div这个父级设置样式，这个时候就有了更多的选择，任选一种即可。
  ```css
  div{
    float: left;
    display: inline-block;
    display: inline-flex;
    position: absolute;
    position: fixed;
    /* 除了上面这些，还可添加这些作用于父级的样式 */
    overflow: hidden;
    overflow: auto;
    display: flex;
    display: table-cell;
  }
  ```
3. 自适应两列布局
  根据特性3: 每一个盒子的左外边缘（marigin）会触碰容器的左内边缘（border-left），即使是浮动元素。
  ```html
  <div class="left">LEFT</div>
  <div class="right">RIGHT</div>
  ```
  ```css
  body{
    border: 5px solid #f00;
  }
  .left {
    width: 100px;
    height: 150px;
    float: left;
    background: #0f0;
    text-align: center;
    line-height: 150px;
    font-size: 20px;
    margin: 5px;
  }
  .right {
    height: 300px;
    background: #00f;
    text-align: center;
    line-height: 300px;
    font-size: 40px;
  }
  ```
  从下图可以看出：left的margin-left外边缘（蓝色margin 5px左侧）和父级容器（body）的border-left（红色border 5px内侧）内边相触碰。
  <img src="../images/css/css_bfc1.png" title="BFC实现两列布局" />

  再根据特性4：BFC的区域不会与浮动盒子产生交集，而是紧贴浮动边缘。
  让right单独成一个BFC，添加样式：
  ```css
  .right{
    overflow: hidden;
  }
  ```
  这样就实现两列布局了，并且right布局可以自适应。
  <img src="../images/css/css_bfc2.png" title="BFC实现两列布局" />

  