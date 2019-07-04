# 3. 继承和多态

## 3.1 继承

```python
#任何类都继承根类object
class Animal(object):
    def run(self):
        print('Animal is running...')
#Dog和Cat继承Animal        
class Dog(Animal):
    pass

class Cat(Animal):
    pass
#Dog和Cat的调用
dog = Dog()
dog.run()

cat = Cat()
cat.run()
#调用结果，继承Animal的run方法
Animal is running...
Animal is running...
```

例子中`Dog`和`Cat`类继承了`Animal`类，因此拥有父类的所有功能。

## 3.1 方法重写

子类可以对父类的方法进行重写（覆盖），方法名和方法参数都不变，方法的执行体改变。当对子类进行方法调用时是调用子类重写的方法而不是父类的方法。例如：

```python
#方法重写
class Dog(Animal):

    def run(self):
        print('Dog is running...')

class Cat(Animal):

    def run(self):
        print('Cat is running...')
        
#重写方法的调用结果
Dog is running...
Cat is running...
```

## 3.2 多态

在类型系统中，类也可以理解为一种特殊的数据类型，即类是变量类型，而是类的实例是变量名。也可以通过`isinstance()`函数来判断某实例是否属于某类。例如：

```python
b = Animal() # b是Animal类型
c = Dog() # c是Dog类型

>>> isinstance(b, Animal)
True
>>> isinstance(c, Dog)
True
#Dog类继承了Animal类，
>>> isinstance(c, Animal)
True
```

Dog继承了Animal类，因此Dog的实例的数据类型既可以是Dog（子类），也可以是Animal（父类）

[Dog是Animal的一种]，反之则不行。

**多态的示例**

```python
#定义一个函数参数为Animal（父类）类型
def run_twice(animal):
    animal.run()
    animal.run()
#入参为父类Animal   
>>> run_twice(Animal())
Animal is running...
Animal is running...
#入参为子类Dog
>>> run_twice(Dog())
Dog is running...
Dog is running...
#入参为子类Cat
>>> run_twice(Cat())
Cat is running...
Cat is running...

#新增一个子类
class Tortoise(Animal):
    def run(self):
        print('Tortoise is running slowly...')
#入参为子类Tortoise        
>>> run_twice(Tortoise())
Tortoise is running slowly...
Tortoise is running slowly...
```

通过以上示例可以看出，当函数的参数类型是父类，传入参数为子类的时候，调用的是具体传入的子类的方法。即调用方只管调用，不管具体的细节。细节由具体的运行对象决定，并且可以在不改变外部调用代码的情况下，增加调用实现的具体细节，即`开闭原则`。

**开闭原则**

对扩展开放：允许新增`Animal`子类；

对修改封闭：不需要修改依赖`Animal`类型的`run_twice()`等函数。

## 3.3 鸭子类型

Python是动态语言，在继承上并不需要像静态语言一样传入一个Animal类型或其子类，或者说不要求严格的继承体系。Python的“`file-like object`”满足“`鸭子类型`”，即一个对象只要看起来像鸭子，走起路来像鸭子，那它就可以被看做是鸭子。

所以并不需要传入一个Animal的类型或子类，只需要传入一个实现了Animal的run()方法的对象即可，例如：

```python
class Timer(object):
    def run(self):
        print('Start...')
```


参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017497232674368