# 2. 循环语句

## 2.1 for循环

for...in循环，即把list或tuple中的每个元素迭代出来，执行后续操作。

```python
names = ['Michael', 'Bob', 'Tracy']
for name in names:
    print(name)
```

Python提供一个`range(x)`函数，生成`0-(x-1)`的整数序列。

```python
>>> list(range(5))
[0, 1, 2, 3, 4]
//求和运算
sum = 0
for x in range(101):
    sum = sum + x
print(sum)
```

## 2.2 while循环

while循环，只要条件满足，就不断循环，条件不满足时退出循环。

```python
sum = 0
n = 99
while n > 0:
    sum = sum + n
    n = n - 2
print(sum)
```

## 2.3 break

在循环中，`break`语句可以提前退出循环。

```python
n = 1
while n <= 100:
    if n > 10: # 当n = 11时，条件满足，执行break语句
        break # break语句会结束当前循环
    print(n)
    n = n + 1
print('END')
```

## 2.4 continue

在循环过程中，可以通过`continue`语句，跳过当前的这次循环，直接开始下一次循环。

```python
n = 0
while n < 10:
    n = n + 1
    if n % 2 == 0: # 如果n是偶数，执行continue语句
        continue # continue语句会直接继续下一轮循环，后续的print()语句不会执行
    print(n)
```

`break`和`continue`通常都必须配合`if`语句使用。


参考：

- https://www.liaoxuefeng.com/wiki/1016959663602400/1017100774566304