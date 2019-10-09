webpackJsonp([12],{d7wy:function(t,s,o){"use strict";Object.defineProperty(s,"__esModule",{value:!0});var a={name:"Toast",components:{codeBlock:o("O6xP").a},data:function(){return{list:[{title:"简单传参",showCode:!1,code:"this.$toast('普通toast')"},{title:"自定义关闭时间",showCode:!1,code:"this.$toast({\n  propsData: {\n    message: '3s后关闭',\n    time: 3000\n  }\n})"},{title:"选择显示位置",showCode:!1,code:"this.$toast({\n  propsData: {\n    message: '选择显示位置',\n    position: 'top'\n  }\n})"},{title:"自定义toast样式",showCode:!1,code:"this.$toast({\n  propsData: {\n    message: '自定义toast样式',\n    wrapStyleObj: {\n      'background': '#666'\n    }\n  }\n})"},{title:"带icon的toast",showCode:!1,code:"this.$toast({\n  propsData: {\n    message: '带icon的toast',\n    type: 'success'\n  }\n})\n "},{title:"带倒计时回调的toast",showCode:!1,code:"this.$toast({\n  propsData: {\n    message: '带倒计时回调的toast',\n    type: 'success'\n  },\n  methods: {\n    callback () {\n      alert('toast 消失了')\n    }\n  }\n})\n "},{title:"全部参数",showCode:!1,code:"this.$toast({\n  propsData: {\n    message: '全部传参',\n    type: 'info',\n    time: 3000,\n    position: 'middle',\n    wrapStyleObj: {\n      'background': '#4c4c4c'\n    }\n  },\n  methods: {\n    callback () {\n        alert('toast 消失了')\n    }\n  }\n})\n "}]}},methods:{showCode:function(t,s){t.showCode?t.showCode=!1:(this.list.map(function(t){return t.showCode=!1}),this.list[s].showCode=!0)},showToast:function(t){this["showToast"+(t+1)]()},showToast1:function(){this.$toast("普通toast")},showToast2:function(){this.$toast({propsData:{message:"3s后关闭",time:3e3}})},showToast3:function(){this.$toast({propsData:{message:"选择显示位置",position:"top"}})},showToast4:function(){this.$toast({propsData:{message:"自定义toast样式",wrapStyleObj:{background:"#666"}}})},showToast5:function(){this.$toast({propsData:{message:"带icon的toast",type:"success",time:3e3}})},showToast6:function(){this.$toast({propsData:{message:"带倒计时回调的toast",type:"success"},methods:{callback:function(){alert("toast 消失了")}}})},showToast7:function(){this.$toast({propsData:{message:"全部传参",type:"info",time:3e3,position:"middle",wrapStyleObj:{background:"#4c4c4c"}},methods:{callback:function(){alert("toast 消失了")}}})}}},e={render:function(){var t=this,s=t.$createElement,o=t._self._c||s;return o("div",{staticClass:"page-wrap toast-wrap"},[o("div",{staticClass:"top"},[t._v("Toast提示")]),t._v(" "),o("div",{staticClass:"block"},t._l(t.list,function(s,a){return o("div",{key:a,staticClass:"block-item",class:{active:s.showCode}},[o("a",{on:{click:function(s){return s.preventDefault(),t.showToast(a)}}},[o("span",{staticClass:"text"},[t._v(t._s(a+1)+"、"+t._s(s.title))]),t._v(" "),o("i",{on:{click:function(o){return o.preventDefault(),o.stopPropagation(),t.showCode(s,a)}}},[t._v("code")])]),t._v(" "),s.showCode?o("code-block",{attrs:{code:s.code}}):t._e()],1)}),0),t._v(" "),t._m(0)])},staticRenderFns:[function(){var t=this.$createElement,s=this._self._c||t;return s("div",[s("a",{staticClass:"aLink",attrs:{c_wrap:"fs-12",href:"https://github.com/cpm828/cpm828.github.io/blob/master/cpm_ui/document/Toast.md"}},[this._v("查看文档")])])}]},n=o("VU/8")(a,e,!1,null,null,null);s.default=n.exports}});
//# sourceMappingURL=toast.844f251bcc66b30a6e1a.js.map