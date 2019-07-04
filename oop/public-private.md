# 2. 访问限制

实例的变量以`__xxx`双下划线开头，没有以`__`双下划线结尾的，则该变量为私有变量，外部一般无法访问。例如：`self.__name = name`。

如果变量名是双下划线开头、双下划线结尾，`__xxx__`是特殊变量而不是私有变量。私有变量的方式可以避免外部对实例内部数据的修改，可以做参数检查。

如果需要获取或修改内部的数据，可以增加`get`和`set`的方法。例如：

```python
class Student(object):
	#构造函数
    def __init__(self, name, score):
        self.__name = name
        self.__score = score
    #get方法  
	def get_name(self):
        return self.__name

    def get_score(self):
        return self.__score
 	#set方法
    def set_score(self, score):
        #参数检查
        if 0 <= score <= 100:
            self.__score = score
        else:
            raise ValueError('bad score')
```

参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017496679217440