# 4. 生成器

在Python中，一边循环一边计算的机制，称为生成器：generator。生成器不必创建完整的list，可以在循环中不断推算出后续的元素，从而可以在获取所需元素的同时节省存储空间。

## 4.1 直接创建generator

创建generator即把列表生成式的`[]`改成`()`。

```python
>>> L = [x * x for x in range(10)]
>>> L
[0, 1, 4, 9, 16, 25, 36, 49, 64, 81]
>>> g = (x * x for x in range(10))
>>> g
<generator object <genexpr> at 0x1022ef630>
```

一般通过`for循环`来获取generator的元素，也可以使用`next(g)`来获取下一个元素。

```python
>>> g = (x * x for x in range(10))
#通过for循环获取元素
>>> for n in g:
...     print(n)
... 
0
1
4
#通过next()获取元素
>>> next(g)
0
>>> next(g)
1
```

## 4.2 通过函数方式创建

通过`yield`关键字将一个函数变成`generator`。例如：

函数的定义：

```python
def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
        print(b)
        a, b = b, a + b
        n = n + 1
    return 'done'
```

生成器的定义：

```python
def fib(max):
    n, a, b = 0, 0, 1
    while n < max:
        yield b
        a, b = b, a + b
        n = n + 1
    return 'done'
```

两者的差别在于生成器将函数的`print(b)`改为`yield b`。`yield`可以翻译为`生成`，即基于某次计算生成某个元素，而不是提前存储了该元素。

函数式的`generator`一般采用`for`循环来获取元素，也可以通过`next()`来获取下一个元素的值，例如：

```python
>>> for n in fib(6):
...     print(n)
...
1
1
2
3
5
8
```

如果要获取`return`的内容，可以捕获`StopIteration`错误，返回值包含在`StopIteration`的`value`中。

```python
>>> g = fib(6)
>>> while True:
...     try:
...         x = next(g)
...         print('g:', x)
...     except StopIteration as e:
...         print('Generator return value:', e.value)
...         break
...
g: 1
g: 1
g: 2
g: 3
g: 5
g: 8
Generator return value: done
```


参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017318207388128
