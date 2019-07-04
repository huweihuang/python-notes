# 1. 切片

切片操作（slice），即从list（tuple是一种特殊的list）中获取部分元素。

- L[m,n]表示从L[m]~L[n-1]的list。
- L[:n]表示从L[0]~L[n-1]的list。
- L[m:]表示从L[m]~L[len(L)-1]。
- L[-m:]表示倒数m个数的list。
- L[m:n:k]表示从L[m:n]list中每k个取一个数组成一个新的list。
- L[::k]表示从L中每k个取一个组成新的list。
- tuple也是一种list（不可变的list），使用切片操作的结果仍为tuple。

```python
#定义list
>>> L = ['Michael', 'Sarah', 'Tracy', 'Bob', 'Jack']
#切片操作
>>> L[0:3]
['Michael', 'Sarah', 'Tracy']
>>> L[:3]
['Michael', 'Sarah', 'Tracy']
>>> L[1:3]
['Sarah', 'Tracy']
>>> L[-2:]
['Bob', 'Jack']
>>> L[-2:-1]
['Bob']

#定义0-99的list
>>> L = list(range(100))
#前10个数每两个取一个
>>> L[:10:2]
[0, 2, 4, 6, 8]
#所有数，每5个取一个
>>> L[::5]
[0, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 90, 95]

#tuple的切片操作
>>> (0, 1, 2, 3, 4, 5)[:3]
(0, 1, 2)

#字符串切片操作
>>> 'ABCDEFG'[:3]
'ABC'
>>> 'ABCDEFG'[::2]
'ACEG'
```

参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017269965565856