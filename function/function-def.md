# 1. 函数的调用

调用函数需要知道函数名和参数，如果传入的参数不对，会报`TypeError`的错误并且给出错误信息。

## 1.1 数据类型转换函数

​	数据类型转换函数可以对数据类型进行转换，例如：

```python
>>> int('123')
123
>>> int(12.34)
12
>>> float('12.34')
12.34
>>> str(1.23)
'1.23'
>>> str(100)
'100'
>>> bool(1)
True
>>> bool('')
False
```

## 1.2 函数引用

函数名其实就是指向一个函数对象的引用，完全可以把函数名赋给一个变量，相当于给这个函数起了一个“别名”：

```python
>>> a = abs # 变量a指向abs函数
>>> a(-1) # 所以也可以通过a调用abs函数
1
```

# 2. 定义函数

## 2.1 函数定义

​	在Python中，定义一个函数要使用`def`语句，依次写出函数名、括号、括号中的参数和冒号`:`，然后，在缩进块中编写函数体，函数的返回值用`return`语句返回。如果没有`return`语句，函数执行完毕后也会返回结果，只是结果为`None`。`return None`可以简写为`return`。

```python
def my_abs(x):
    if x >= 0:
        return x
    else:
        return -x
```

## 2.2 空函数

如果想定义一个什么事也不做的空函数，可以用`pass`语句：

```python
def nop():
    pass
```

`pass`语句主要用来暂时让程序运行不报错，待后续再补充函数内容。同理，`pass`还可以用在其他语句里，比如：

```python
if age >= 18:
    pass
```

## 2.3 参数检查

​	调用函数时，如果参数个数不对，Python解释器会自动检查出来，并抛出`TypeError`。如果要对参数类型进行检查，可以使用内置函数`isinstance()`实现。例如：

```python
def my_abs(x):
    if not isinstance(x, (int, float)):
        raise TypeError('bad operand type')
    if x >= 0:
        return x
    else:
        return -x
```

## 2.4 多返回值

```python
import math

def move(x, y, step, angle=0):
    nx = x + step * math.cos(angle)
    ny = y - step * math.sin(angle)
    return nx, ny
```

​	实际上python的多返回值是一个tuple。只不过按位置依次赋值。

```python
#多返回值
>>> x, y = move(100, 100, 60, math.pi / 6)
>>> print(x, y)
151.96152422706632 70.0
#返回值为tuple
>>> r = move(100, 100, 60, math.pi / 6)
>>> print(r)
(151.96152422706632, 70.0)
```

参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017106984190464