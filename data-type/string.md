# 2. 字符串和编码

## 2.1 字符编码

- `ASCII`编码，早期的编码包含大小写英文字母、数字和一些符号，用一个字节（8位）表示。因编码量少可能会出现乱码问题。
- `Unicode`编码，统一各国语言编码，用两个字节（16位）表示。如果文本全是英文，则会比ASCII编码需要多一倍的存储空间，在存储和传输上不划算。
- `UTF-8`编码，即可变长的Unicode编码，UTF-8编码把一个Unicode字符根据不同的数字大小编码成1-6个字节，常用的英文字母被编码成1个字节，汉字通常是3个字节，只有很生僻的字符才会被编码成4-6个字节。如果你要传输的文本包含大量英文字符，用UTF-8编码能节省空间。

> 编码转换工具：https://tool.chinaz.com/tools/unicode.aspx

## 2.2 字符编码使用场景

 -  在计算机内存中，统一使用Unicode编码。

- 当需要保存到硬盘或者需要传输的时候，就转换为UTF-8编码。

  例如：

  ​	用记事本编辑的时候，从文件读取的UTF-8字符被转换为Unicode字符到内存里，编辑完成后，保存的时候再把Unicode转换为UTF-8保存到文件。

  <img src="http://res.cloudinary.com/dqxtn0ick/image/upload/v1512810598/article/python/basics/UnicodeToUTF-8.png" width="40%"/>

  ​	浏览网页的时候，服务器会把动态的生成的Unicode内容转换为UTF-8再传输到浏览器，所以很多网页的源码上会有类似`<meta charset="UTF-8" />`的信息，表示该网页正是用的UTF-8编码。

  <img src="http://res.cloudinary.com/dqxtn0ick/image/upload/v1512810599/article/python/basics/website-UTF-8.png" width="40%"/>

## 2.3 Python的字符串

​	Python3的版本中，字符串是Unicode编码，即支持多语言。

​	对于单个字符的编码，Python提供`ord()`函数获取字符的整数表示，`chr()`函数把编码转换为对应的字符。例如：

```python
>>> ord('A')
65
>>> ord('中')
20013
>>> chr(66)
'B'
>>> chr(25991)
'文'
```

如果知道字符的整数编码，可以用十六进制写`str`：

```python
>>> '\u4e2d\u6587'
'中文'
```

## 2.4 字符串(编码)转换

​	Python的字符串类型是`str`，在内存中以Unicode表示，一个字符对应若干个字节。如果要在网络上传输，或者保存到磁盘上，就需要把`str`变为以字节为单位的`bytes`(UTF-8/ASCII编码)。

​	Python对`bytes`类型的数据用带`b`前缀的单引号或双引号表示：

```Python
x = b'ABC'
```

## 2.4.1 encode()[str→bytes]

​	以Unicode表示的`str`通过`encode()`方法可以编码为指定的`bytes`，即Unicode编码转换成UTF-8编码或ASCII编码，例如：

```python
>>> 'ABC'.encode('ascii')
b'ABC'
>>> '中文'.encode('utf-8')
b'\xe4\xb8\xad\xe6\x96\x87'
#错误例子
>>> '中文'.encode('ascii')  
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
UnicodeEncodeError: 'ascii' codec can't encode characters in position 0-1: ordinal not in range(128)
```

## 2.4.2 decode()[bytes→str]

​	要把UTF-8编码或ASCII编码转换成Unicode编码，即bytes类型转换为str类型，可用decode()转换。例如：

```python
>>> b'ABC'.decode('ascii')
'ABC'
>>> b'\xe4\xb8\xad\xe6\x96\x87'.decode('utf-8')
'中文'
#错误例子
>>> b'\xe4\xb8\xad\xff'.decode('utf-8')
Traceback (most recent call last):
  ...
UnicodeDecodeError: 'utf-8' codec can't decode byte 0xff in position 3: invalid start byte
```

​	如果`bytes`中只有一小部分无效的字节，可以传入`errors='ignore'`忽略错误的字节：

```python
>>> b'\xe4\xb8\xad\xff'.decode('utf-8', errors='ignore')
'中'
```

## 2.4.3 len()

​	对于`str`类型len()计算的是字符数，对于`bytes`类型len()计算的是字节数。

```python
#对于str类型
>>> len('ABC')
3
>>> len('中文')
2
#对于bytes类型
>>> len(b'ABC')
3
>>> len(b'\xe4\xb8\xad\xe6\x96\x87')
6
>>> len('中文'.encode('utf-8'))
6
```

​	1个中文字符经过UTF-8编码后通常会占用3个字节，而1个英文字符只占用1个字节。

​	为了避免中文乱码，一般使用UTF-8编码对`str`和`bytes`进行转换，即Unicode→UTF-8。所以一般在Python源文件开头写以下信息：

```python
#!/usr/bin/env python3
# -*- coding: utf-8 -*-
```

第一行注释是为了告诉Linux/OS X系统，这是一个Python可执行程序，Windows系统会忽略这个注释；

第二行注释是为了告诉Python解释器，按照UTF-8编码读取源代码，否则，你在源代码中写的中文输出可能会有乱码。

## 2.5 格式化

## 2.5.1 %的方式

​	使用`%`来格式化字符串，其中`%s`永远起作用，可以把任何数据类型转换成字符串，如果字符串中包含`%`，则使用`%%`转义表示字符串中的`%`。常用占位符如下：

| 占位符  | 替换内容   |
| ---- | ------ |
| %s   | 字符串    |
| %d   | 整数     |
| %f   | 浮点数    |
| %x   | 十六进制整数 |

例如：

```python
>>> 'Hello, %s' % 'world'
'Hello, world'
>>> 'Hi, %s, you have $%d.' % ('Michael', 1000000)
'Hi, Michael, you have $1000000.'
#整数和浮点数
>>> print('%2d-%02d' % (3, 1))
>>> print('%.2f' % 3.1415926)
# %s的通用性
>>> 'Age: %s. Gender: %s' % (25, True)
'Age: 25. Gender: True'
#转义字符串中的%
>>> 'growth rate: %d %%' % 7
'growth rate: 7 %'
```

## 2.5.2 format()

​	可以使用字符串的`format()`方法，它会用传入的参数依次替换字符串内的占位符`{0}`、`{1}`……。但建议直接使用`%`的方式。

```python
>>> 'Hello, {0}, 成绩提升了 {1:.1f}%'.format('小明', 17.125)
'Hello, 小明, 成绩提升了 17.1%'
```

## 2.6 json 中的中文解析

使用`json.dumps(data, ensure_ascii=False)`解析json中的中文。

```python
#!/usr/bin/python
# -*- coding: utf8 -*-

import json
import sys

reload(sys)
sys.setdefaultencoding('utf-8')

data = [ { 'a' : '中文' } ]

result = json.dumps(data, ensure_ascii=False)
print result
```

输出结果：

```bash
[{"a": "中文"}]
```

参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017075323632896
