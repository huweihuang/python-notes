# 3. list和tuple类型

## 3.1 list

list表示列表，是**可变**的**有序**列表，即有序的集合，可以随时添加和删除元素。

### 3.1.1 list的定义

```python
>>> classmates = ['Michael', 'Bob', 'Tracy']
>>> classmates
['Michael', 'Bob', 'Tracy']
```

### 3.1.2 len()

用`len()`函数可以获得list元素的个数

```python
>>> len(classmates)
3
```

### 3.1.3 list的索引

- list元素索引从0开始
- 索引可以引用负数表示倒数序号，例如classmates[-1]表示倒数最后一个元素，索引`-1`等价于`len(classmates) - 1`
- 索引越界会报`IndexError`错误，倒序索引也会越界

### 3.1.4 list元素增删

#### 3.1.4.1 追加末尾元素

```python
>>> classmates.append('Adam')
>>> classmates
['Michael', 'Bob', 'Tracy', 'Adam']
```

#### 3.1.4.2 指定位置插入元素

```python
>>> classmates.insert(1, 'Jack')
>>> classmates
['Michael', 'Jack', 'Bob', 'Tracy', 'Adam']
```

#### 3.1.4.3 删除末尾元素

```python
>>> classmates.pop()
'Adam'
>>> classmates
['Michael', 'Jack', 'Bob', 'Tracy']
```

#### 3.1.4.4 删除指定位置元素

用pop(i)的方法，i为索引值

```python
>>> classmates.pop(1)
'Jack'
>>> classmates
['Michael', 'Bob', 'Tracy']
```

#### 3.1.4.5 替换元素

即直接给对应索引的元素重新赋值。

```python
>>> classmates[1] = 'Sarah'
>>> classmates
['Michael', 'Sarah', 'Tracy']
```

### 3.1.5多维list

​	list中元素的数据类型可以不同，如果要实现二维list，即将一维list中的元素定义为list即可，同理可以实现多维list。例如访问二维list可用`s[2][1]`的方式，表示一维list中的第三个元素list中的第二个元素。

```python
>>> s = ['python', 'java', ['asp', 'php'], 'scheme']
>>> len(s)
4
```

### 3.1.6 空list

​	空list即一个元素也没有，长度为0。

```python
>>> L = []
>>> len(L)
0
```

## 3.2 tuple

### 3.2.1 tuple的定义

​	tuple表示元组，即**不可变**的**有序**元素的集合。即没有修改元素的函数，例如append()，insert()，元素赋值等。

​	因为tuple元素不可变，所以代码更安全。当定义tuple时，元素就必须被确定下来。如果tuple中只含一个元素，则在该元素后加逗号。避免与小括号运算产生歧义。

```python
#以下是单元素tuple的定义
>>> t = (1,)
>>> t
(1,)
#以下是小括号运算
>>> t = (1)
>>> t
1
```

### 3.2.2 特别说明

tuple中的元素不可变表示元素的指向不可变，但该元素如果是list，则该list的内容可变。即list表示的是指向，该list的指向不可变，但是list中元素的指向可变，即list中的元素可变。例如：

```python
>>> t = ('a', 'b', ['A', 'B'])
>>> t[2][0] = 'X'
>>> t[2][1] = 'Y'
>>> t
('a', 'b', ['X', 'Y'])
```

示意图：

list元素修改前：`t = ('a', 'b', ['A', 'B'])`

<img src="http://res.cloudinary.com/dqxtn0ick/image/upload/v1512810598/article/python/basics/tuple1.png" width="50%"/>

list元素修改后：`t = ('a', 'b', ['X', 'Y'])`

<img src="http://res.cloudinary.com/dqxtn0ick/image/upload/v1512810598/article/python/basics/tuple2.png" width="50%"/>


参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017092876846880