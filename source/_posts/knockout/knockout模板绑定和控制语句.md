---
title:         knockout模板绑定和控制语法 # 标题
description:   knockout模板绑定和控制语法:if/ifnot/with/foreach等 # 副标题
tags: # 标签分类
    - KnockOut
---

## 常见方法

### text
```
name('哈哈');

<p data-bind="text: name"></p>
```

### html
```
errorText('第1行有name错误<br>第二行有id不匹配');

<p data-bind="html: errorText"></p>
```

### visible
```
isShow(true);

<div data-bind="visible: isShow">哈哈，看见我了</div>
```

### if
```
写法1：
isShow(true);

<div data-bind="if: isShow">哈哈，看见我了</div>

写法2：
isShow(false);

<!-- ko if:isShow -->
<div>哈哈，看见我了</div>
<!-- /ko -->
```

### ifnot
字面意思，if取反

### if和visible的区别
if不显示时dom不存在，visible存在

### css(class)
```
profitWarning(-50);

<div data-bind="css: {profitWarning: currentProfit() < 0}"></div>
```

### style
```
profitWarning(-50);

<div data-bind="style: {color: currentProfit() < 0 ? 'red' : 'black', fontWeight: isSevere() ? 'bold' : ''}"></div>
```

### attr
```
url('http://www.****');
detail('我是title');

<a href="" data-bind="attr: {href: url, title: details}"></a>
```

### foreach
#### foreach遍历简单数组
```
<ul data-bind="foreach: months">
  <li>
    The current item is: <b data-bind="text: $data"></b>
  </li>
</ul>

<script type="text/javascript"> 
  ko.applyBindings({
      months: [ 'Jan', 'Feb', 'Mar', 'etc' ]
  });
</script>  
```

#### foreach遍历复杂数组
```
<div data-bind="foreach: teacherList">
  <p>
    索引:<span data-bind="text: $index"></span>
    teacherID:<span data-bind="text: teacheId"></span>
    teacherName:<span data-bind="text: teacheName"></span>
    <button data-bind="click: $parent.removeMe">删除</button>
  </p>
  <button data-bind="click: addOne">增加</button>
</div>

<script type="text/javascript">
  function AppViewModel() {
    var self = this;
    self.teacherList([
      {
        teacheId: '001',
        teacheName: '哈哈'
      },
      {
        teacheId: '002',
        teacheName: '嘻嘻'
      },
      {
        teacheId: '003',
        teacheName: '呵呵'
      }
    ]);
    self.removeMe = function () {
      self.teacherList.remove(this);
    };
    self.addOne = function () {
      self.teacherList.push({
        teacheId: '004',
        teacheName: '喔喔'
      })
    }
  }
  ko.applyBindings(new AppViewModel());
</script>
```

#### foreach注释语法
```
<ul>
  <li class="header">Header item</li>
  <!-- ko foreach: myItems -->
    <li>Item <span data-bind="text: $data"></span></li>
  <!-- /ko -->
</ul>

<script type="text/javascript">
  ko.applyBindings({
      myItems: [ 'A', 'B', 'C' ]
  });
</script>  
```


### with控制流

#### wtih正常写法
```
当父级是ko对象，子级是非ko对象，在模板中我们不能直接查找子级a().b()，这样是不OK得，我们可以借助with语法实现这种情况的渲染，父级with:a()，然后就可以直接使用子级了

<h1 data-bind="text: city"> </h1>
<p data-bind="with: coords">
  Latitude: <span data-bind="text: latitude"> </span>,
  Longitude: <span data-bind="text: longitude"> </span>
</p>
 
<script type="text/javascript"> 
  ko.applyBindings({
    city: "London",
    coords: {
      latitude:  51.5001524,
      longitude: -0.1262362
    }
  });
</script>  
```

#### with注释写法
```
<ul>
  <li>Header element</li>
  <!-- ko with: outboundFlight -->
    <div data-bind="text: outsize"></div>
  <!-- /ko -->
  <!-- ko with: inboundFlight -->
    <div data-bind="text: insize"></div>
  <!-- /ko -->
</ul>

<script type="text/javascript">
  ko.applyBindings({
    outboundFlight: {
      outsize: 51.5001524
    },
    inboundFlight: {
      insize: 32.2323423
    }
  });
</script>  
```



## form场景

### click
```
写法1：渲染时执行
<button data-bind="click: clickBtn"></button>

写法2：带bind，不触发不执行
<button data-bind="click: clickBtn.bind($data)"></button>

注意：点击方法前可能得加$root、$parent等前缀，示层级而定

也可以将点击事件包装起来：

写法3：
<button data-bind="click: function(data, event) { myFunction('param1', 'param2', data, event) }"></button> 
```


### event表单事件
```
<div>
  <div data-bind="event: { mouseover: enableDetails, mouseout: disableDetails }">
      Mouse over me
  </div>
  <div data-bind="visible: detailsEnabled">
      Details
  </div>
</div>

<script type="text/javascript">
  var viewModel = {
    detailsEnabled: ko.observable(false),
    enableDetails: function() {
      this.detailsEnabled(true);
    },
    disableDetails: function() {
      this.detailsEnabled(false);
    }
  };
  ko.applyBindings(viewModel);
</script>    
```


### submit表单提交
```
<form data-bind="submit: doSomething">
  ... form contents go here ...
  <button type="submit">Submit</button>
</form>

<script type="text/javascript"> 
  var viewModel = {
    doSomething : function(formElement) {
      // ... now do something
    }
  };
</script>
```

### enable or disable表单禁用
```
<p>
    <input type='checkbox' data-bind="checked: hasCellphone" />
    I have a cellphone
</p>
<p>
    Your cellphone number:
    <input type='text' data-bind="value: cellphoneNumber, enable: hasCellphone" />
</p>
 
<script type="text/javascript">
  var viewModel = {
    hasCellphone : ko.observable(false),
    cellphoneNumber: ""
  };
</script>  
```

### value or textInput表单输入
```
textInput同value的性质是一致的，但是textInput是在view改变之后，model立即改变，达到即时更新。

<p>Login name: <input data-bind="value: userName" /></p>
<p>Password: <input type="password" data-bind="value: userPassword" /></p>
 
<script type="text/javascript">
  var viewModel = {
    userName: ko.observable(""),        // Initially blank
    userPassword: ko.observable("abc"), // Prepopulate
  };
</script>  
```

### hasFocus表单聚焦
```
判断表单是否激活，处理不同情况，可点击按钮手动触发激活输入框

<input data-bind="hasFocus: isSelected" />
<button data-bind="click: setIsSelected">Focus programmatically</button>
<span data-bind="visible: isSelected">The textbox has focus</span>

<script type="text/javascript">
  var viewModel = {
    isSelected: ko.observable(false),
    setIsSelected: function() { 
      this.isSelected(true) 
    }
  };
  ko.applyBindings(viewModel);
</script>  
```

### checked单选框复选框被选中
```
根据变量来控制复选框的选中与否
<p>Send me spam: <input type="checkbox" data-bind="checked: wantsSpam" /></p>
 
<script type="text/javascript">
    var viewModel = {
        wantsSpam: ko.observable(true) // Initially checked
    };
 
    // ... then later ...
    viewModel.wantsSpam(false); // The checkbox becomes unchecked
</script>
```

### select option下拉框
#### 简单遍历-单选
```
<p>
  Destination country:
  <select data-bind="options: availableCountries"></select>
</p>
 
<script type="text/javascript">
  var viewModel = {
    // These are the initial options
    availableCountries: ko.observableArray(['France', 'Germany', 'Spain'])
  };

  // ... then later ...
  viewModel.availableCountries.push('China'); // Adds another option
</script>
```

#### 简单遍历-多选
```
<p>
  Choose some countries you would like to visit:
  <select data-bind="options: availableCountries" size="5" multiple="true"></select>
</p>
 
<script type="text/javascript">
  var viewModel = {
      availableCountries: ko.observableArray(['France', 'Germany', 'Spain'])
  };
</script>
```

#### 复杂遍历
```
options: 表示遍历的数组项，如果层级很深，可以在外层考虑绑定with，实现简化层级
optionsText: 下拉框展示的文案，及数组中某一项的某个字段
value: 当前文案
optionsCaption: 默认显示的文案，改默认文案不对应任何值
event-change: 下拉框触发改变

<p>
  Your country:
  <select data-bind="options: availableCountries,
                     optionsText: 'countryName',
                     value: selectedCountry,
                     optionsCaption: 'Choose...',
                     event: {change: selectChange}"></select>
</p>
 
<div data-bind="visible: selectedCountry"> <!-- Appears when you select something -->
  You have chosen a country with population
  <span data-bind="text: selectedCountry() ? selectedCountry().countryPopulation : 'unknown'"></span>.
</div>
 
<script type="text/javascript">
  // Constructor for an object with two properties
  var Country = function(name, population) {
    this.countryName = name;
    this.countryPopulation = population;
  };

  var viewModel = {
    availableCountries : ko.observableArray([
        new Country("UK", 65000000),
        new Country("USA", 320000000),
        new Country("Sweden", 29000000)
    ]),
    selectedCountry : ko.observable(), // Nothing selected by default
    selectChange: function () {
      alert('下拉框变化了');
    }
  };
</script>
```

#### 多级下拉框
```
对于像三级城市列表那种的下拉框，每一个下拉框的改变都需要刷新下一个下拉框或页面的数据，select之间必须联动，此例我故意将城市数据层级设置城多级

<p data-bind="text: para()"></p>
<!-- ko with:bigData().smallData -->
  <select data-bind="options: provinces,
                     optionsText: 'provinceName',
                     value: $root.firstValue,
                     optionsCaption: '选择省份',
                     event: {change: firstSelectChange}"></select>
<!-- /ko -->

<!-- ko with: $root.firstValue -->
  <select data-bind="options: citys,
                     optionsText: 'cityName',
                     value: $root.secondValue,
                     optionsCaption: '选择城市',
                     event: {change: secondSelectChange}"></select>
<!-- /ko -->                     

<!-- ko with: $root.secondValue -->
  <select data-bind="options: countys,
                     optionsText: 'countyName',
                     value: $root.thirdValue,
                     optionsCaption: '选择地区',
                     event: {change: thirdSelectChange}"></select>
<!-- /ko -->

<button data-bind="click: commit">提交</button>


<script type="text/javascript">
  var viewModel = {
      para: ko.observable('没错，我就是那个动态标题！'),
      bigData: ko.observable({
        smallData: {
          provinces: [
            {
              provinceId: '010000',
              provinceName: '北京',
              citys: [
                {
                  cityId: '010100',
                  cityName: '北京市',
                  countys: [
                    {
                      countyId: '010101',
                      countyName: '东城区'
                    },
                    {
                      countyId: '010102',
                      countyName: '西城区'
                    }
                  ]
                }
              ]
            },
            {
              provinceId: '090000',
              provinceName: '江西省',
              citys: [
                {
                  cityId: '090100',
                  cityName: '南昌市',
                  countys: [
                    {
                      countyId: '090101',
                      countyName: '东湖区'
                    },
                    {
                      countyId: '090102',
                      countyName: '西湖区'
                    }
                  ]
                },
                {
                  cityId: '090200',
                  cityName: '九江市',
                  countys: [
                    {
                      countyId: '090201',
                      countyName: '浔阳区'
                    }
                  ]
                },
                {
                  cityId: '090300',
                  cityName: '景德镇市',
                  countys: [
                    {
                      countyId: '090201',
                      countyName: '珠江区'
                    }
                  ]
                }
              ]
            }
          ]
        }
      }),
      firstValue: ko.observable(''),
      secondValue: ko.observable(''),
      thirdValue: ko.observable('')
  };
  var firstSelectChange = function () {
    window.alert('点击了1号下拉框');
  };
  var secondSelectChange = function () {
    window.alert('点击了2号下拉框');
  };
  var thirdSelectChange = function () {
    window.alert('点击了3号下拉框');
  };
  var commit = function () {
    window.alert('我选择了：' + viewModel.firstValue().provinceName + '--' + viewModel.secondValue().cityName + '--' + viewModel.thirdValue().countyName);
  };
  // 初始化数据（如果不加初始化数据，默认只出现第一个下拉框，选择后出现第二个，再选择出现第三个）
  for (var i in viewModel.bigData().smallData.provinces) {
    if (viewModel.bigData().smallData.provinces[i].provinceId === '010000') {
      viewModel.firstValue(viewModel.bigData().smallData.provinces[i]);
      // break;
    }
    for (var j in viewModel.bigData().smallData.provinces[i].citys) {
      if (viewModel.bigData().smallData.provinces[i].citys[j].cityId === '010100') {
        viewModel.secondValue(viewModel.bigData().smallData.provinces[i].citys[j]);
        // break;
      }
    }
  }

  ko.applyBindings(viewModel);
</script>
```