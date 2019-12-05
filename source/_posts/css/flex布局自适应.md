---
title:         flex布局自适应 # 标题
description:   flex布局单边固定，另一边自适应，flex内部单行省略等 # 副标题
date:          2019-11-20 # 建立日期
updated:       2019-11-20 # 更新日期
comments:      true  # 开启评论功能
tags: # 标签分类
    - CSS
---

以下只介绍一些flex布局容易忽略但是却很有必要的用法，不介绍兼容性，可使用autoprefixer来解决。

- 场景1：左侧固定，右侧自适应，三列布局类似
    <img src="../images/css/flex1.png" title="左侧固定，右侧自适应" />
    ```html
    <div class="box">
        <div class="left">left</div>
        <div class="right">right</div>
    </div>
    ```

    ```css
    .box{
        display: flex;
    }
    .left{
        width: 100px;
        height: 100px;
        background-color: red;
    }
    .right{
        height: 100px;
        background-color: green;
        flex: 1; /* 自适应 */
    }
    ```

- 场景2：左右固定，中间自适应，中间内容超长对左侧造成自动放缩
    <img src="../images/css/flex2.png" title="左右固定，中间自适应，中间内容超长对左侧造成自动放缩" />
    ```html
    <div class="box">
        <div class="left">left</div>
        <div class="center">center、center、center、center、center、center、center、center、center、</div>
        <div class="right">right</div>
    </div>
    ```

    ```css
    .box{
        display: flex;
    }
    .left{
        width: 100px;
        height: 100px;
        background-color: red;
        flex-shrink: 0; /* 不会因为其他元素的超长而造成自动放缩 */
    }
    .center{
        height: 100px;
        word-break: break-all;
        background-color: green;
        flex: 1; /* 自适应 */
    }
    .right{
        width: 100px;
        height: 100px;
        background-color: blue;
        flex-shrink: 0; /* 不会因为其他元素的超长而造成自动放缩 */
    }
    ```

- 场景3：左右固定，中间自适应，中间内容超出单行省略
    <img src="../images/css/flex3.png" title="左右固定，中间自适应，中间内容超出单行省略" />
    ```html
    <div class="box">
        <div class="left">left</div>
        <div class="right">
            <div class="left2">时代峻峰肯定是家乐福凯迪拉克接口路径困了就睡地方看时空裂缝决定是否就是点击神鼎飞丹砂立刻就飞快的数据分开及身份</div>
            <div class="right2">right2</div>
        </div>
    </div>
    ```

    ```css
    .box{
        display: flex;
    }
    .left{
        width: 100px;
        height: 200px;
        background-color: red;
        flex-shrink: 0;
    }
    .right{
        height: 200px;
        background-color: blue;
        flex-shrink: 0;
        display: flex;
        flex: 1;
        width: 0; /*设置width后，可以清楚flex布局的影响*/
    }
    .left2{
        height: 100px;
        word-break: break-all;
        background-color: green;
        flex: 1;
        overflow: hidden;
        text-overflow: ellipsis;
        white-space: nowrap;
    }
    .right2{
        width: 100px;
        height: 100px;
        background-color: pink;
    }
    ```

- 未完待续...