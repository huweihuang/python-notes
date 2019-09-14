# 4. dict和set类型

## 4.1 dict

### 4.1.1 dict的定义

dict即字典，相当于golang中的`map`类型，key-value型。具有极快的查找速度。

```python
//dict的赋值
>>> d = {'Michael': 95, 'Bob': 75, 'Tracy': 85}
>>> d['Michael']
95
//dict元素的赋值
>>> d['Adam'] = 67
```

由于dict中**key的值是唯一**的，因此如果多次赋值，最终结果为最后一次的赋值。

### 4.1.2 dict的查找

如果key不存在会报错，检测key是否存在可以通过`in`或`get()`方法。当key不存在时，`in`的方式返回`False`，`get()`方法返回`None`或指定值。

```python
#key不存在的报错
>>> d['Thomas']
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
KeyError: 'Thomas'

#in方式检查key是否存在
>>> 'Thomas' in d
False

#get()方法检查key是否存在
>>> d.get('Thomas')
>>> d.get('Thomas', -1)
-1
```

### 4.1.3 dict的删除

要删除dict中的元素，可以通过用`pop(key)`方法，删除该key对应的键值对。

```python
>>> d.pop('Bob')
75
>>> d
{'Michael': 95, 'Tracy': 85}
```

### 4.1.4 特别说明

**dict的特点**：

1. 查找和插入的速度极快，不会随着key的增加而变慢；
2. 需要占用大量的内存，内存浪费多。
3. dict的key必须是**不可变对象**，在Python中，字符串、整数等都是不可变的，而list是可变的，就不能作为key。

**对比list的特点**：

1. 查找和插入的时间随着元素的增加而增加；
2. 占用空间小，浪费内存很少。

## 4.2 set

​	set表示无序和无重复元素的集合，与数学意义上的集合类似，也可以看成是只有key没有value的dict。

### 4.2.1 set的定义

要创建一个set，需要提供一个list作为输入集合，如果list中有重复元素则自动过滤掉。

```python
>>> s = set([1, 2, 3])
>>> s
{1, 2, 3}
#如果有重复元素会自动过滤掉
>>> s = set([1, 1, 2, 2, 3, 3])
>>> s
{1, 2, 3}
```

### 4.2.2 set的添加和删除

通过`add(key)`方法可以添加元素到set中，可以重复添加，但无效。

```python
>>> s.add(4)
>>> s
{1, 2, 3, 4}
>>> s.add(4)
>>> s
{1, 2, 3, 4}
```

通过`remove(key)`方法可以删除元素。

```python
>>> s.remove(4)
>>> s
{1, 2, 3}
```

### 4.2.3 set的交集和并集

```python
>>> s1 = set([1, 2, 3])
>>> s2 = set([2, 3, 4])
#交集
>>> s1 & s2
{2, 3}
#并集
>>> s1 | s2
{1, 2, 3, 4}
```

## 4.3 不可变对象

​	变量表示一个指向，而变量指向的内容表示一个对象。例如`a="abc"`中`a`是变量即指向，而`abc`是字符串对象。

​	Python中整数和字符串是不可变对象，而list是可变对象。

```python
>>> a = 'abc'
>>> b = a.replace('a', 'A')
>>> b
'Abc'
>>> a
'abc'
```

​	例如上例中，`a`是变量，`abc`是字符串对象，当调用a的`replace`的方法时，实际上是基于原字符串对象重新创建了一个新的字符串对象`Abc`，而没有改变原字符串对象的内容。

​	对于不变对象来说，调用对象自身的任意方法，不会改变该对象自身的内容。而会创建新的对象并返回。


参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017104324028448