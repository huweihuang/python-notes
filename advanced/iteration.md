# 2. 迭代

## 2.1 迭代的概念

迭代：在某类对象的集合中通过遍历的方法来获取元素，对元素执行某项操作。

Python中的可迭代对象有：list，tuple，dict，str等，包括可迭代的自定义类型。

判断一类对象是否可迭代，可以通过collections模块的Iterable类型判断。例如：

```python
>>> from collections import Iterable
>>> isinstance('abc', Iterable) # str是否可迭代
True
>>> isinstance([1,2,3], Iterable) # list是否可迭代
True
>>> isinstance(123, Iterable) # 整数是否可迭代
False
```

## 2.2 迭代的使用

在Python中，迭代是通过`for ... in`来完成的。

### 2.2.1 dict的迭代

```python
>>> d = {'a': 1, 'b': 2, 'c': 3}
>>> for key in d:
...     print(key)
...
a
c
b
```

- dict默认迭代的是key，`for key in d`。
- 可以使用`for value in d.values()`来迭代value。
- 可以用`for k, v in d.items()`来迭代key和value。

### 2.2.2 字符串的迭代

```python
>>> for ch in 'ABC':
...     print(ch)
...
A
B
C
```

### 2.2.3 迭代的索引

Python内置的`enumerate`函数可以把一个list变成索引-元素对，这样就可以在`for`循环中同时迭代索引和元素本身。

```python
>>> for i, value in enumerate(['A', 'B', 'C']):
...     print(i, value)
...
0 A
1 B
2 C
```

### 2.2.4 多变量迭代

在for中，同时引用多个变量。例如：

```python
>>> for x, y in [(1, 1), (2, 4), (3, 9)]:
...     print(x, y)
...
1 1
2 4
3 9
```

参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017316949097888