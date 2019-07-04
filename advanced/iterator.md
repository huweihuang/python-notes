# 5. 迭代器

## 5.1 可迭代对象

可以直接作用于`for`循环的对象统称为可迭代对象：`Iterable`。主要有：

- 集合数据类型，如`list`、`tuple`、`dict`、`set`、`str`等
- `generator`，包括生成器和带`yield`的generator function

可以使用`isinstance()`判断一个对象是否是`Iterable`对象：

```python
>>> from collections import Iterable
>>> isinstance([], Iterable)
True
>>> isinstance({}, Iterable)
True
>>> isinstance('abc', Iterable)
True
>>> isinstance((x for x in range(10)), Iterable)
True
>>> isinstance(100, Iterable)
False
```

## 5.2 迭代器

可以被`next()`函数调用并不断返回下一个值的对象称为迭代器：`Iterator`。

生成器都是`Iterator`对象，但`list`、`dict`、`str`是`Iterable`，而不是`Iterator`。

可以使用`isinstance()`判断一个对象是否是`Iterator`对象：

```python
>>> from collections import Iterator
>>> isinstance((x for x in range(10)), Iterator)
True
>>> isinstance([], Iterator)
False
>>> isinstance({}, Iterator)
False
>>> isinstance('abc', Iterator)
False
```

可以通过`iter()`函数将`Iterable`转换成`Iterator`。

```python
>>> isinstance(iter([]), Iterator)
True
>>> isinstance(iter('abc'), Iterator)
True
```

Python的`Iterator`对象表示的是一个数据流，可以是无限大的数据流，例如全体自然数。

- `Iterator`的元素是基于计算的，可以理解为惰性的、动态的、长度未知的（元素个数可能无限）。
- `list`、`dict`、`str`的元素是基于存储的，可以理解为静态的、长度已知的（元素个数有限）。



参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017323698112640