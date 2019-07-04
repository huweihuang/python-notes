# 5. 实例属性和类属性

Python中除了给实例绑定属性外，还可以给类绑定属性，即类属性。类属性归类所有，但该类的所有实例都可以访问到类属性。实例属性的优先级比类属性高，类属性和实例属性一般不使用相同名字，如果同名则实例属性会屏蔽掉类属性。

```python
>>> class Student(object):
...     name = 'Student'
    	def __init__(self, name):
        	self.name = name
...
>>> s = Student() # 创建实例s
>>> print(s.name) # 打印name属性，因为实例并没有name属性，所以会继续查找class的name属性
Student
>>> print(Student.name) # 打印类的name属性
Student
>>> s.name = 'Michael' # 给实例绑定name属性
>>> print(s.name) # 由于实例属性优先级比类属性高，因此，它会屏蔽掉类的name属性
Michael
>>> print(Student.name) # 但是类属性并未消失，用Student.name仍然可以访问
Student
>>> del s.name # 如果删除实例的name属性
>>> print(s.name) # 再次调用s.name，由于实例的name属性没有找到，类的name属性就显示出来了
Student
```

参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017594591051072