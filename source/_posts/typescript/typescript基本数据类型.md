---
title:         typescript基本数据类型 # 大标题
description:   TypeScript中几种基本数据类型 # 小标题
date:          2020-02-24 # 建立日期
updated:       2020-02-24 # 更新日期
comments:      true  # 开启评论功能
tags:
    - TypeScript
---


## JavaScript基本数据类型
- ES5:
undefined、null、string、number、boolean、object

- ES6新增：
symbol

## TypeScript基本数据类型
sting字符串、number数值、boolean布尔值
array数组、tuple元组
enum枚举、any任意
undefined、null
void、never

### string类型类型
```ts
const str: string = 'abc'
```


### number数值类型
```ts
const num: number = 1
```


### boolean布尔值类型
```ts
const flag: boolean = true
```


### array数组类型
数组中所有元素是同一种数据类型
```ts
// 1. 在元素类型后面带上[]
const arr1: number[] = [1, 2, 3]
const arr2: string[] = ['a', 'b', 'c']

// 2. 使用数组泛型 Array<元素类型>
const arr3: Array<number> = [1, 2, 3]
const arr4: Array<string> = ['a', 'b', 'c']
```


### tuple元组
属于数组的一种，可定义不同类型的元素
```ts
const tumple1: [number, string] = [1, '2']
```


### enum枚举类型
```ts
// 默认从0开始编号
enum Color {Red, Green, Blue} // 0、1、2
const color: Color = Color.Red

// 全部自定义编号
enum Color2 {Red = 2, Green = 4, Blue = 6} // 2、4、6
const color2: Color2 = Color2.Red

// 部分自定义标号（自定义的前面为默认标号，自定义的后面+1）
enum Color3{Red, Green = 3, Blue, Pink} // 0、3、4、5
const color3: Color3 = Color3.Pink

// 由枚举的值得到它的名字
const index2: string = Color2[2]
```


### any任意类型
定义之后可任意变化类型
```ts
let any1: any = 1
any1 = '2'
any1 = true
any1 = null

// 如：
const title: any = document.getElementById('title')
title.style.color = 'red'
```


### undefined和null
所有类型的子类型，常用于联合类型中
```ts
const u: undefined = undefined
const n: null = null

// 联合类型
let num2: number | undefined | null
num2 = 1
num2 = undefined
num2 = null
```


### void
没有任何类型，与any类型相反，一般用于定义方法的时候方法没有返回值
```ts
function tip (): void {
  console.log('Your operation may be make a msitake, Please check')
}

// 假设方法有返回值，则不能使用void
function getData (name: string = 'TypeScript'): string {
  return `Hello ${name}`
}
```


### never
never类型是其他类型的子类型，表示的是那些永不存在的值的类型。
never类型是那些总是会抛出异常或根本就不会有返回值的函数表达式或箭头函数表达式的返回值类型。
变量也可能是 never类型，当它们被永不为真的类型保护所约束时。
```ts
function error (message: string): never {
  throw new Error(message)
}

function infiniteLoop(): never {
  while (true) {
  }
}

如：
var never1: never;
never1 = 1; // 报错
```