# 1. Module

Python 模块(`Module`)，是一个 Python 文件，以 `.py` 结尾，包含了 Python 对象定义和Python语句。

例如：

support.py表示一个模块，模块名为文件名即`support`。

```python
def print_func( par ):
   print "Hello : ", par
   return
```

调用示例：

```python
#!/usr/bin/python
# -*- coding: UTF-8 -*-
 
# 导入模块
import support
 
# 调用模块里包含的函数
support.print_func("Runoob")
```

# 2. Package

包是一个分层次的文件目录结构，它定义了一个由模块及子包，和子包下的子包等组成的 Python 的应用环境。

`__init__.py` 用于标识当前文件夹是一个包，可以为空。

即关系范围如下：

一个包中可以包含多个模块（Python文件），一个模块（Python文件）可以包含多个独立功能的函数。

```bash
package > module > function
```

# 3. 引用

可以通过`as`来给模块设定别名缩写，方便引用。

## 3.1. import

```python
# import 模块
import module1[, module2[,... moduleN]]

# import 模块中的函数
import module.function  # 等价于 from module import function
```

## 3.2. from…import

```python
# 格式
from modname import name1[, name2[, ... nameN]]

# import 模块中函数
from module import function

# import 包中的模块
from package import module as alias
```

## 3.3. from…import* 

把一个模块的所有内容全都导入到当前的命名空间。

```python
from module import *
```

# 4. 命名空间与作用域

- 变量：表示对象的名字或标识
- 命名空间：表示变量和对象的范围
- 局部变量和全局变量重名，局部变量会覆盖全局变量。全局变量用global表示。

# 5. 搜索路径

Python解析器对模块位置的搜索顺序：

1. 当前目录。
2. PYTHONPATH的每个目录。
3. 查看Python安装时的默认包路径。例如：`/usr/lib64/python2.6/site-packages`。

可以通过查询`sys.path`查看模块搜索路径。

## 5.1. PYTHONPATH

环境变量PYTHONPATH有多个目录组成，类似环境变量PATH。

例如

```bash
export PYTHONPATH=/usr/local/lib/python
```

# 6. 跨包引用

- 将项目的根目录加到PYTHONPATH变量中

- sys.path.append("..")

示例：

```bash
project
├── package1
│   ├── __init__.py
│   ├── module_11.py
│   └── module_12.py
├── package2
│   ├── __init__.py
│   ├── module_21.py
│   └── module_22.py
├── main.py
└── tool.py
```

## 6.1. 导入同级模块

`module_11.py`文件导入module_12.py模块

```python
import module_12
```

## 6.2. 导入下级模块

`main.py`文件导入`module_12.py`模块

```python
from package1 import module_12
# 或者
import package1.module_12
```

## 6.3. 导入上级模块

`module_11.py`导入上级目录的`tool.py`模块

```python
import sys 
sys.path.append("..") 

import tool
```

相当于通过`sys.path.append("..") `进入上级目录，然后类似导入`同级目录`模块的方式导入。

## 6.4. 导入跨包下级模块

`module_11.py`导入`package2`包的`module_21.py`模块

```python
import sys 
sys.path.append("..") 

from package2 import module_21
```

相当于通过`sys.path.append("..") `进入上级目录，然后类似导入`下级目录`模块的方式导入。





参考：

- https://www.runoob.com/python/python-modules.html
- https://packaging.python.org/tutorials/packaging-projects/
- https://docs.python.org/3/