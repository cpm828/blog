---
title:         jquery上传excel等文件 # 标题
description:   jquery上传excel等文件 # 副标题
tags: # 标签分类
    - jQuery
---


在实际应用中，有时我们需要将一个excel表上传给后端同学进行数据传递，那么怎么实现呢？

FormData对象法

```html
<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <style>
        .test-form{
            display: inline-block;
        }
        .show-name{
            display: inline-block;
            width: 200px;
            height: 36px;
            line-height: 36px;
            padding: 0 10px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
            border: 1px solid #ccc;
            vertical-align: middle;
        }
        .submit-btn{
            display: inline-block;
            width: 80px;
            height: 36px;
            border: none;
            outline: none;
            vertical-align: middle;
            font-size: 16px;
        }
        .show-error{
            display: inline-block;
            height: 36px;
            line-height: 36px;
            color: #f00;
            display: none;
        }
    </style>
</head>
<body>
    <label>
        <input type="file" id="testInput" accept=".xls, .xlsx" style="left:-9999px;position:absolute;">
        <span class="show-name" id="showName">请选择你要上传的文件</span>
    </label>
    <button class="submit-btn" id="submitBtn">上传</button>
    <span class="show-error" id="showError"></span>

    <script src="https://cdn.bootcss.com/jquery/2.2.3/jquery.min.js"></script>
    <script>
        _fileUpload();
        $('#submitBtn').on('click', function (event) {
            var fileInput = $("#testInput");
            var errorText = $('#showError');
            if (fileInput.val() === '') {
                errorText.show().text('对不起，您还没有上传文件');
                return false;
            }
            var formData = new FormData(); // new FormData对象
            var file = fileInput[0].files[0]; // 此处必须这样去到file对象
            formData.append('importTeacher', file);
            $.ajax({
                url: "/test.vpage",
                type: "POST",
                data: formData,
                processData: false, // 此处必须设置processData
                contentType: false, // 此处必须设置contentType
                async: true,
                timeout: 5 * 60 * 1000,
                success: function (data) {
                    if (data.success) {
                        window.alert('上传成功');
                    } else {
                        errorText.show().text(data.info);
                    }
                }
            })
        });

        function _fileUpload () {
            $(document).on("change", '#testInput', function () {
                $('#showError').hide().text('');
                var fileInput = $('#testInput').val();
                fileInput = fileInput.substring(fileInput.lastIndexOf("\\") + 1);
                $('#showName').text(fileInput);
            });
        }
    </script>
</body>
</html>
```

温馨提示：FormData()在IE8下会有兼容性

结果图例：
<img src="../images/jquery/upload-reult-demo.png" width="300px" />

> 参考：[web上传的几种方式](http://www.toutiao.com/a6477148984946197006/?tt_from=mobile_qq&utm_campaign=client_share&app=news_article&utm_source=mobile_qq&iid=15966553967&utm_medium=toutiao_ios)