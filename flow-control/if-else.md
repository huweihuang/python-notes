# 1. 条件语句

## 1.1 if格式

```python
if <条件判断1>:
    <执行1>
elif <条件判断2>:
    <执行2>
elif <条件判断3>:
    <执行3>
else:
    <执行4>
```

​	以上是if语句的完整格式，注意事项：

- Python使用缩进规则，如果if判断条件为true，则执行缩进部分的内容。
- if的执行逻辑是从上往下判断，如果某个判断为true，则会忽略剩下的`elif`和`else`。

例如：以下例子打印的结果是teenager，即满足第一个if条件则后续判断不再执行。

```Python
age = 20
if age >= 6:
    print('teenager')
elif age >= 18:
    print('adult')
else:
    print('kid')
```

## 1.2 条件简写

```python
if x:
    print('True')
```

只要`x`是非零数值、非空字符串、非空list等，就判断为`True`，否则为`False`。

## 1.3 input()使用

```python
s = input('birth: ')
birth = int(s)
if birth < 2000:
    print('00前')
else:
    print('00后')
```

`input()`返回的数据类型是`str`，`str`不能直接和整数比较，必须先把`str`转换成整数。Python提供了`int()`函数来转换成整数。


参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017099478626848