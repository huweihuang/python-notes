# 4. 获取对象信息

## 4.1 type()

判断对象的类型可以使用`type()`函数，对象包括基本的数据类型和函数、类等。例如：

```python
#基本数据类型
>>> type(123)
<class 'int'>
>>> type('str')
<class 'str'>
>>> type(None)
<type(None) 'NoneType'>
#函数和类
>>> type(abs)
<class 'builtin_function_or_method'>
>>> type(a)
<class '__main__.Animal'>
```

**类型比较**

可以在`if`语句中比较两个对象的数据类型是否一致。

```python
>>> type(123)==type(456)
True
>>> type(123)==int
True
>>> type('abc')==type('123')
True
>>> type('abc')==str
True
>>> type('abc')==type(123)
False
```

**type()中常量**

`types`模块中定义的常量可以用于判断对象是否是函数、生成器等类型。

```python
>>> import types
>>> def fn():
...     pass
...
>>> type(fn)==types.FunctionType
True
>>> type(abs)==types.BuiltinFunctionType
True
>>> type(lambda x: x)==types.LambdaType
True
>>> type((x for x in range(10)))==types.GeneratorType
True
```

## 4.2 isinstance()

**继承关系判断**

使用`isinstance()`函数可以判断一个对象是否是该类型本身或者位于该类型的父继承链上。例如：

```python
#继承关系如下
object -> Animal -> Dog -> Husky
#创建实例
>>> a = Animal()
>>> d = Dog()
>>> h = Husky()
#继承关系判断
>>> isinstance(h, Husky)
True
>>> isinstance(h, Dog)
True
>>> isinstance(h, Animal)
True
```

以上的继承关系中，子类的类型除了本身的类型外，还可以归属于其祖类（父类及以上）的类型。

**基本数据类型的判断**

`isinstance()`也可以用来判断基本数据类型。

```python
#判断基本数据类型
>>> isinstance('a', str)
True
>>> isinstance(123, int)
True
>>> isinstance(b'a', bytes)
True
#判断某类型中的一种
>>> isinstance([1, 2, 3], (list, tuple))
True
>>> isinstance((1, 2, 3), (list, tuple))
True
```

>优先使用isinstance()判断类型

## 4.3 dir()

`dir()`函数可以获取一个对象的所有属性和方法，返回一个包含字符串的list。例如：

```python
>>> dir('ABC')
['__add__', '__class__',..., '__subclasshook__', 'capitalize', 'casefold',..., 'zfill']
```

`dir()`可以结合`getattr()`、`setattr()`以及`hasattr()`使用，例如：

```python
>>> class MyObject(object):
...     def __init__(self):
...         self.x = 9
...     def power(self):
...         return self.x * self.x
...
>>> obj = MyObject()

>>> hasattr(obj, 'x') # 有属性'x'吗？
True
>>> obj.x
9
>>> hasattr(obj, 'y') # 有属性'y'吗？
False
>>> setattr(obj, 'y', 19) # 设置一个属性'y'
>>> hasattr(obj, 'y') # 有属性'y'吗？
True
>>> getattr(obj, 'y') # 获取属性'y'
19
>>> obj.y # 获取属性'y'
19
```

此类函数是在未知对象内部数据时使用，例如从文件流中读取图像，先判断是否有`read()`方法，如果有则可以读取。

```python
def readImage(fp):
    if hasattr(fp, 'read'):
        return readData(fp)
    return None
```


参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017499532944768