# 1. Python装饰器

装饰器本身是Python的一个函数或类，返回值也是一个函数或类。装饰器，顾名思义就是在不修改函数代码的基础上，给函数增加额外的功能。常见的场景有：插入日志，权限校验，性能测试，事务处理等。Python装饰器函数通过将原函数作为参数传入装饰器函数从而实现增加额外的功能。

示例：

```python
def use_logging(func):

    def wrapper():
        logging.warn("%s is running" % func.__name__)
        return func()   # 把 foo 当做参数传递进来时，执行func()就相当于执行foo()
    return wrapper

def foo():
    print('i am foo')

foo = use_logging(foo)  # 因为装饰器 use_logging(foo) 返回的时函数对象 wrapper，这条语句相当于  foo = wrapper
foo()                   # 执行foo()就相当于执行 wrapper()
```

上述例子通过调用装饰器函数`use_logging`来执行原函数`foo`。但是这种处理方式不够优雅，因此通过`@语法糖`的方式来实现装饰器。

```python
def use_logging(func):

    def wrapper():
        logging.warn("%s is running" % func.__name__)
        return func()
    return wrapper

@use_logging
def foo():
    print("i am foo")

foo()
```

上述例子，通过`@use_logging`的方式对foo函数增加装饰器，本质仍是将foo函数作为参数传入use_logging函数中，但可以直接调用foo函数即可。增加了可读性， 我们只需要理解原函数本身的业务逻辑和装饰器函数所起的作用即可。

# 2. 不定参数函数的装饰器

由于执行装饰器函数，最终会返回wrapper()函数，等价于原函数。当原函数需要传入不定参数时，需要对装饰器函数添加不定参数。

示例如下：

```python
def use_logging(func):

    def wrapper(*args, **kwargs):
        logging.war("%s is running" % func.__name__)
        return func(*args, **kwargs)
    return wrapper

@use_logging
def foo(name, age=None, height=None):
    print("I am %s, age %s, height %s" % (name, age, height))
```

# 3. 指定带参数装饰器

当需要对装饰器函数本身添加参数时，可以在装饰器外网包一层带参数的函数将参数传入装饰器中，然后返回装饰器函数。

示例：

```python
def use_logging(level):
    def decorator(func):
        def wrapper(*args, **kwargs):
            if level == "warn":
                logging.warn("%s is running" % func.__name__)
            elif level == "info":
                logging.info("%s is running" % func.__name__)
            return func(*args)
        return wrapper

    return decorator

@use_logging(level="warn")
def foo(name='foo'):
    print("i am %s" % name)

foo()
```

# 4. 装饰器的顺序

一个函数可以定义多个装饰器，装饰器的调用顺序为从里到外，从下到上。

示例：

```python
@a
@b
@c
def f ():
    pass
```

等价于

```python
f = a(b(c(f)))
```

# 5. property装饰器

property装饰器可以用来将方法像属性一样访问，用来创建只读属性，防止属性被修改。

1、方法像属性一样访问

```python
class DataSet(object):
  @property
  def method_with_property(self): ##含有@property
      return 15
  def method_without_property(self): ##不含@property
      return 15

l = DataSet()
print(l.method_with_property) # 加了@property后，可以用调用属性的形式来调用方法,后面不需要加（）。
print(l.method_without_property())  #没有加@property , 必须使用正常的调用方法的形式，即在后面加()
```

2、创建只读属性

```python
class DataSet(object):
    def __init__(self):
        self._images = 1
        self._labels = 2 #定义属性的名称
    @property
    def images(self): #方法加入@property后，这个方法相当于一个属性，这个属性可以让用户进行使用，而且用户有没办法随意修改。
        return self._images 
    @property
    def labels(self):
        return self._labels
l = DataSet()
#用户进行属性调用的时候，直接调用images即可，而不用知道属性名_images，因此用户无法更改属性，从而保护了类的属性。
print(l.images) # 加了@property后，可以用调用属性的形式来调用方法,后面不需要加（）。
```



参考：

- https://foofish.net/python-decorator.html
- https://zhuanlan.zhihu.com/p/64487092
