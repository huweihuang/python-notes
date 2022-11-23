> 本文主要介绍如何安装Python的开发虚拟环境

## Virtualenv

参考：https://virtualenv.pypa.io/en/latest/

```bash
python3 -m virtualenv <DIR>
source <DIR>/bin/activate
```

or

```bash
# 安装virtualenv
pip3 install virtualenv
# 设置PATH
export PATH="$HOME/Library/Python/3.9/bin/:$PATH"

# 进入项目目录
cd myproject
# 创建venv目录
virtualenv venv
# 启动
source venv/bin/activate
```

## Venv

```bash
# python3 -m venv <DIR>
python3 -m venv venv
source venv/bin/activate
```



参考：

- https://virtualenv.pypa.io/en/latest/

- https://packaging.python.org/en/latest/tutorials/installing-packages/#creating-and-using-virtual-environments

- https://docs.python.org/3/library/venv.html
