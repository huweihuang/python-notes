pip 是 Python 包管理工具，该工具提供了对Python 包的查找、下载、安装、卸载的功能。

## pip的使用

### 查看与升级pip

```bash
pip --version     # Python2.x 版本命令
pip3 --version    # Python3.x 版本命令

# 升级pip
pip install --upgrade pip    # python2.x
pip3 install --upgrade pip   # python3.x
```

### 安装依赖包

```bash
# 基于requirements.txt
pip install -r requirements.txt

# 安装一个包
pip install SomePackage              # 最新版本
pip install SomePackage==1.0.4       # 指定版本
pip install 'SomePackage>=1.0.4'     # 最小版本

# 升级
pip install --upgrade SomePackage

# 卸载
pip uninstall SomePackage

# 列出已经安装的包
pip list

# 搜索
pip search SomePackage
```

参考：

- https://pypi.org/project/pip/
- https://www.runoob.com/w3cnote/python-pip-install-usage.html


