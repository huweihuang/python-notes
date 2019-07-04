# 4. 递归函数

## 4.1 递归函数的定义

递归函数即函数在内部调用函数本身（自己调用自己）。

递归的关键点：

- 递归结束的临界值，通常使用if语句来判断临界值
- 递归体的递归逻辑

例如，以下是fact(n) = n! = 1 x 2 x 3 x ... x (n-1) x n = (n-1)! x n = fact(n-1) x n 的递归函数。

```python
#递归函数的定义
def fact(n):
    if n==1:
        return 1
    return n * fact(n - 1)
#计算5的阶乘，递归函数调用细节
===> fact(5)
===> 5 * fact(4)
===> 5 * (4 * fact(3))
===> 5 * (4 * (3 * fact(2)))
===> 5 * (4 * (3 * (2 * fact(1))))
===> 5 * (4 * (3 * (2 * 1)))
===> 5 * (4 * (3 * 2))
===> 5 * (4 * 6)
===> 5 * 24
===> 120
```

## 4.2 栈溢出问题

​	在计算机中，函数调用是通过栈（stack）这种数据结构实现的，每当进入一个函数调用，栈就会加一层栈帧，每当函数返回，栈就会减一层栈帧。由于栈的大小不是无限的，所以，递归调用的次数过多，会导致栈溢出。

例如：

```python
>>> fact(1000)
Traceback (most recent call last):
  File "<stdin>", line 1, in <module>
  File "<stdin>", line 4, in fact
  ...
  File "<stdin>", line 4, in fact
RuntimeError: maximum recursion depth exceeded in comparison
```

## 4.3 尾递归

​	解决递归调用栈溢出的方法是通过**尾递归**优化。尾递归是指，在函数返回的时候，调用自身本身，并且，return语句不能包含表达式。这样，编译器或者解释器就可以把尾递归做优化，使递归本身无论调用多少次，都只占用一个栈帧，不会出现栈溢出的情况。

例如：

```python
#尾递归函数的定义
def fact(n):
    return fact_iter(n, 1)

def fact_iter(num, product):
    if num == 1:
        return product
    return fact_iter(num - 1, num * product)
    
#计算5的阶乘，递归函数调用细节
===> fact_iter(5, 1)
===> fact_iter(4, 5)
===> fact_iter(3, 20)
===> fact_iter(2, 60)
===> fact_iter(1, 120)
===> 120
```

尾递归调用时，如果做了优化，栈不会增长，无论多少次调用也不会导致栈溢出。但实际上大多数编程语言没有针对尾递归做优化，Python解释器也没有做优化，因此当没有优化的情况下任何递归函数都存在栈溢出的问题。



参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017268131039072