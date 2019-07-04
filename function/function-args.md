# 3. 函数的参数

​	定义函数的时候，把参数的名字和位置确定下来，函数的接口定义就完成了。对于函数的调用者来说，只需要知道如何传递正确的参数，以及函数将返回什么样的值，而函数内部的复杂逻辑被封装起来，调用者无需了解。

## 3.1 位置参数

​	位置参数，即传入的参数有位置顺序区分。例如以下的`x`和`n`根据位置不同，接收对应位置的传入参数。

```python
def power(x, n):
    s = 1
    while n > 0:
        n = n - 1
        s = s * x
    return s
```

## 3.2 默认参数

​	默认参数，即对某个参数设置默认值，如果没有传入该参数则使用默认值，如果有传入该参数则使用传入值。

- 必须参数在前，默认参数在后


- 一般将变化小的参数设置为默认参数，变化大的设置为必选参数

```python
#函数定义
def power(x, n=2):
    s = 1
    while n > 0:
        n = n - 1
        s = s * x
    return s
#函数调用   
>>> power(5)
25
>>> power(5, 3)
125
```

有多个默认参数时，可以按顺序提供默认参数，也可以指定默认参数的参数名传值而不按参数顺序。例如：

```python
#函数定义
def enroll(name, gender, age=6, city='Beijing'):
    print('name:', name)
    print('gender:', gender)
    print('age:', age)
    print('city:', city)
#按顺序提供默认参数，即7表示age的值   
enroll('Bob', 'M', 7)
#按参数名提供默认参数，即city值，而没有age的值
enroll('Adam', 'M', city='Tianjin')
```

**注意事项**：默认参数必须指向不可变对象，例如整数，字符串，`None`等。不能指向可变对象，例如list。

```python
#错误示例，默认参数为可变对象list
add_end(L=[]):
    L.append('END')
    return L
#每次调用都会在list中添加元素  
>>> add_end()
['END']
>>> add_end()
['END', 'END']
>>> add_end()
['END', 'END', 'END']
```

以上例子中，Python函数在定义的时候，默认参数`L`的值就被计算出来了，即`[]`，因为默认参数`L`也是一个变量，它指向对象`[]`，每次调用该函数，如果改变了`L`的内容，则下次调用时，默认参数的内容就变了，不再是函数定义时的`[]`了。

可改为指向`None`这个不可变对象来避免该问题。例如：

```python
#默认参数指向不可变对象None
def add_end(L=None):
    if L is None:
        L = []
    L.append('END')
    return L
#每次调用恢复原默认值
>>> add_end()
['END']
>>> add_end()
['END']
```

## 3.3 可变参数

可变参数，即待传入的参数的个数是可变的，定义时在参数前面加个`*`，例如`*number`。可变参数在函数调用时实际上是一个tuple。

```python
#定义可变参数 *number
def calc(*numbers):
    sum = 0
    for n in numbers:
        sum = sum + n * n
    return sum
#函数调用
>>> calc(1, 2)
5
>>> calc()
0
#已存在list待传入
>>> nums = [1, 2, 3]
>>> calc(nums[0], nums[1], nums[2])
14
#通过list方式出传入可变参数
>>> nums = [1, 2, 3]
>>> calc(*nums)
14
```

## 3.4 关键字参数

关键字参数，即可以传入0个或任意个含参数名的参数，关键字参数在函数调用时实际上是一个dict。

关键参数定义时在参数前面加`**`，例如`**kw`。

```python
#定义关键字参数
def person(name, age, **kw):
    print('name:', name, 'age:', age, 'other:', kw)
#传入必选参数
>>> person('Michael', 30)
name: Michael age: 30 other: {}
#传入可选的关键字参数
>>> person('Adam', 45, gender='M', job='Engineer')
name: Adam age: 45 other: {'gender': 'M', 'job': 'Engineer'}
#使用dict方式传入关键字参数
>>> extra = {'city': 'Beijing', 'job': 'Engineer'}
>>> person('Jack', 24, **extra)
name: Jack age: 24 other: {'city': 'Beijing', 'job': 'Engineer'}
```

通过dict方式传入实际上是传入一份拷贝，函数参数的改变并不会影响到函数外原dict的值。

## 3.5 命名关键字参数

通过对关键字参数命名的方式限制只能传入指定名字的关键字参数，而不能传入其他参数。命名关键字参数需要一个特殊分隔符`*`，`*`后面的参数被视为命名关键字参数。例如：

```python
#定义命名关键字参数
def person(name, age, *, city, job):
    print(name, age, city, job)
#命名关键字参数的调用    
>>> person('Jack', 24, city='Beijing', job='Engineer')
Jack 24 Beijing Engineer
```

命名关键字参数必须传入参数名，如果没有传入参数名，调用将报错。

```python
>>> person('Jack', 24, 'Beijing', 'Engineer')
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
TypeError: person() takes 2 positional arguments but 4 were given
```

命名关键字参数可以有缺省值，即默认参数。

```python
#命名关键字参数的缺省值
def person(name, age, *, city='Beijing', job):
    print(name, age, city, job)
#函数调用
>>> person('Jack', 24, job='Engineer')
Jack 24 Beijing Engineer
```

## 3.6 参数组合

必选参数、默认参数、可变参数、关键字参数和命名关键字参数，这5种参数可以组合使用。但参数定义的顺序必须是：必选参数、默认参数、可变参数、命名关键字参数和关键字参数。

```python
#参数组合的定义
def f1(a, b, c=0, *args, **kw):
    print('a =', a, 'b =', b, 'c =', c, 'args =', args, 'kw =', kw)

def f2(a, b, c=0, *, d, **kw):
    print('a =', a, 'b =', b, 'c =', c, 'd =', d, 'kw =', kw)
    
#参数组合的调用
>>> f1(1, 2, 3, 'a', 'b', x=99)
a = 1 b = 2 c = 3 args = ('a', 'b') kw = {'x': 99}
>>> f2(1, 2, d=99, ext=None)
a = 1 b = 2 c = 0 d = 99 kw = {'ext': None}
```

通过tuple和dict调用参数组合函数：

```python
#f1
>>> args = (1, 2, 3, 4)
>>> kw = {'d': 99, 'x': '#'}
>>> f1(*args, **kw)
a = 1 b = 2 c = 3 args = (4,) kw = {'d': 99, 'x': '#'}
#f2
>>> args = (1, 2, 3)
>>> kw = {'d': 88, 'x': '#'}
>>> f2(*args, **kw)
a = 1 b = 2 c = 3 d = 88 kw = {'x': '#'}
```

对于任意函数，都可以通过类似`func(*args, **kw)`的形式调用它，无论它的参数是如何定义的。


参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017261630425888