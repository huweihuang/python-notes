> 以下使用pip方式安装

# 1. 安装Python

# 2. 安装pip

说明：安装完python3默认安装了pip3。

# 3. 安装虚拟环境 

## 3.1. [virtualenv](https://virtualenv.pypa.io/) 

参考：https://virtualenv.pypa.io/en/latest/installation/

virtualenv可以提供分离的Python环境。

**1、安装virtualenv**

```bash
# virtualenv
pip install --user virtualenv
```

**2、创建并激活虚拟环境**

```bash
# 创建虚拟环境路径
mkdir ~/.virtualenvs/ 
python3 -m venv ~/.virtualenvs/djangodev
# 激活虚拟环境
source ~/.virtualenvs/djangodev/bin/activate
# 或者
. ~/.virtualenvs/djangodev/bin/activate
```

## 3.2. [virtualenvwrapper](https://virtualenvwrapper.readthedocs.io/en/latest/)

参考：https://virtualenvwrapper.readthedocs.io/en/latest/install.html

**1、安装virtualenvwrapper**

```bash
# virtualenvwrapper
pip install --user virtualenvwrapper
```

将以下内容添加到`.zshrc`或`.bashrc`中，然后执行`source ~/.zshrc`。

```bash
export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/local/bin/virtualenvwrapper.sh
```

如果出现`/usr/local/bin/virtualenvwrapper.sh`文件找不到的报错，则在以下目录下查找并将该文件拷贝到`/usr/local/bin/`目录中。

```bash 
# ll ~/Library/Python/3.7/bin
total 120
-rwxr-xr-x  1 user  group   261B  9 21 23:56 pbr
-rwxr-xr-x  1 user  group   259B  9 21 23:56 virtualenv
-rwxr-xr-x  1 user  group   264B  9 21 23:56 virtualenv-clone
-rwxr-xr-x  1 user  group    41K  2 10  2019 virtualenvwrapper.sh
-rwxr-xr-x  1 user  group   2.2K  2 10  2019 virtualenvwrapper_lazy.sh
```

**2、创建虚拟环境**

```bash
➜  ~ mkvirtualenv django
Using base prefix '/Library/Frameworks/Python.framework/Versions/3.7'
New python executable in /Users/user/.virtualenvs/django/bin/python3.7
Also creating executable in /Users/user/.virtualenvs/django/bin/python
Installing setuptools, pip, wheel...
done.
virtualenvwrapper.user_scripts creating /Users/user/.virtualenvs/django/bin/predeactivate
virtualenvwrapper.user_scripts creating /Users/user/.virtualenvs/django/bin/postdeactivate
virtualenvwrapper.user_scripts creating /Users/user/.virtualenvs/django/bin/preactivate
virtualenvwrapper.user_scripts creating /Users/user/.virtualenvs/django/bin/postactivate
virtualenvwrapper.user_scripts creating /Users/user/.virtualenvs/django/bin/get_env_details
(django) ➜  ~
```

> workon可以查看当前的虚拟环境。

# 4. 安装Django

```bash
pip install Django
```

# 5. 验证

如果可以正常显示出以下内容，说明安装django成功。

```bash
~ python
Python 3.7.4 (v3.7.4:e09359112e, Jul  8 2019, 14:36:03)
[GCC 4.2.1 (Apple Inc. build 5666) (dot 3)] on darwin
Type "help", "copyright", "credits" or "license" for more information.
>>> import django
>>> print(django.get_version())
2.2.5
>>>
```



参考

- https://docs.djangoproject.com/en/2.2/intro/install/
- https://docs.djangoproject.com/en/2.2/topics/install/#installing-official-release