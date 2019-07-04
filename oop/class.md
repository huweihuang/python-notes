# 1. 类和实例

在Python中所有的数据类型都可以视为对象，也可以自定义对象。自定义的对象数据类型即面向对象中的类（Class）概念。类是抽象的模板，实例是具体的对象。

**类的定义**

Python使用`class`关键字定义类：

```python
class Student(object):

    def __init__(self, name, score):
        self.name = name
        self.score = score

    def print_score(self):
        print('%s: %s' % (self.name, self.score))
```

 **初始化函数**

类中使用`__init__`方法实现构造函数的功能，该函数的第一个参数的`self`，表示创建的实例本身，调用时传参只需要传入其他参数，不需要传入`self`参数，使用`__init__`方法则不能传入空参数。

**创建实例**

```python
>>> bart = Student('Bart Simpson', 59)
>>> bart.name
'Bart Simpson'
>>> bart.score
59
```

**类的方法**

类内部定义的方法来实现对类内部属性数据的封装，例如例子中的`print_score(self)`方法。定义一个类的方法除了第一个参数是`self`外，其他与函数的定义一样，调用方法时`self`参数不用传入，其他参数正常传入。

方法可以理解为与实例绑定的函数，可以直接访问实例内部的数据。

参考:

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017496031185408