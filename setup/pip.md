pip 是 Python 包管理工具，该工具提供了对Python 包的查找、下载、安装、卸载的功能。 

# 1. 查看与升级pip版本

```bash
pip --version     # Python2.x 版本命令
pip3 --version    # Python3.x 版本命令

# 升级pip
pip install --upgrade pip    # python2.x
pip3 install --upgrade pip   # python3.x
```

# 2. 安装依赖包

```bash
# 基于requirements.txt
pip install -r requirements.txt
pip install -r requirements.txt -i https://pypi.org/simple/

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

# 3. 设置pip镜像源

永久设置镜像源

```bash
# 设置pip配置文件
mkdir -p ~/.pip/
vi ~/.pip/pip.conf

[global] 
index-url = http://pypi.douban.com/simple 
[install] 
trusted-host=pypi.douban.com


# 国内镜像源
豆瓣 (douban) http://pypi.douban.com/simple/ 
阿里云 http://mirrors.aliyun.com/pypi/simple/
清华大学 https://pypi.tuna.tsinghua.edu.cn/simple/
```

临时设置镜像源

```bash
pip install pygame -i http://pypi.douban.com/simple
pip install pygame -i http://pypi.douban.com/simple --trusted-host pypi.douban.com
```

# 4. 自动生成requirement.txt

```bash
 # 安装
 pip install pipreqs
 # 在当前目录生成,强制覆盖原有的requirement.txt文件
 pipreqs . --encoding=utf8 --force
```



参考：

- https://pypi.org/project/pip/
- https://www.runoob.com/w3cnote/python-pip-install-usage.html
- https://pip.pypa.io/en/stable/cli/pip_install/
