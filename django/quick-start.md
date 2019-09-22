# 1. 创建项目

```bash
$ django-admin startproject mysite
```

mysite的目录结构

```bash
$ tree ./
./
├── manage.py   # 管理 Django 项目的命令行工具
└── mysite   # 项目
    ├── __init__.py  # 表示一个Python包
    ├── settings.py  # 项目配置文件
    ├── urls.py      # url声明
    └── wsgi.py
```

目录说明：

- 最外层的 `mysite/` 根目录是项目的容器。
- `manage.py`: 管理 Django 项目的命令行工具。具体参考[django-admin and manage.py](https://docs.djangoproject.com/en/2.2/ref/django-admin/)。
- 里面一层的 `mysite/` 目录包含你的项目，是一个纯 Python 包。它的名字就是当你引用它内部任何东西时需要用到的 Python 包名。 (比如 `mysite.urls`).
- `mysite/__init__.py`：一个空文件，告诉 Python 这个目录应该被认为是一个 Python 包。
- `mysite/settings.py`：Django 项目的配置文件。具体参考 [Django settings](https://docs.djangoproject.com/en/2.2/topics/settings/) 。
- `mysite/urls.py`：Django 项目的 URL 声明，就像你网站的“目录”。具体参考 [URL dispatcher](https://docs.djangoproject.com/en/2.2/topics/http/urls/)。
- `mysite/wsgi.py`：项目运行在 WSGI 兼容的Web服务器上的入口。具体参考  [How to deploy with WSGI](https://docs.djangoproject.com/en/2.2/howto/deployment/wsgi/) 。

# 2. 运行

执行以下命令

```bash
$ python manage.py runserver
```

运行结果如下：

```bash
$ python manage.py runserver
Watching for file changes with StatReloader
Performing system checks...

System check identified no issues (0 silenced).

You have 17 unapplied migration(s). Your project may not work properly until you apply the migrations for app(s): admin, auth, contenttypes, sessions.
Run 'python manage.py migrate' to apply them.

September 22, 2019 - 02:08:02
Django version 2.2.5, using settings 'mysite.settings'
Starting development server at http://127.0.0.1:8000/
Quit the server with CONTROL-C.

# 以下是网页访问的日志
[22/Sep/2019 02:08:18] "GET / HTTP/1.1" 200 16348
[22/Sep/2019 02:08:18] "GET /static/admin/css/fonts.css HTTP/1.1" 200 423
[22/Sep/2019 02:08:18] "GET /static/admin/fonts/Roboto-Bold-webfont.woff HTTP/1.1" 200 86184
[22/Sep/2019 02:08:18] "GET /static/admin/fonts/Roboto-Regular-webfont.woff HTTP/1.1" 200 85876
[22/Sep/2019 02:08:18] "GET /static/admin/fonts/Roboto-Light-webfont.woff HTTP/1.1" 200 85692
Not Found: /favicon.ico
[22/Sep/2019 02:08:19] "GET /favicon.ico HTTP/1.1" 404 1972
```

在浏览器访问`http://127.0.0.1:8000/`。

# 3. django-admin

`django-admin`是Django的命令行工具，具体使用帮助如下：

```bash
$ django-admin

Type 'django-admin help <subcommand>' for help on a specific subcommand.

Available subcommands:

[django]
    check
    compilemessages
    createcachetable
    dbshell
    diffsettings
    dumpdata
    flush
    inspectdb
    loaddata
    makemessages
    makemigrations
    migrate
    runserver
    sendtestemail
    shell
    showmigrations
    sqlflush
    sqlmigrate
    sqlsequencereset
    squashmigrations
    startapp
    startproject
    test
    testserver
```

# 4. manage.py

```bash
$ python manage.py  --help

Type 'manage.py help <subcommand>' for help on a specific subcommand.

Available subcommands:

[auth]
    changepassword
    createsuperuser

[contenttypes]
    remove_stale_contenttypes

[django]
    check
    compilemessages
    createcachetable
    dbshell
    diffsettings
    dumpdata
    flush
    inspectdb
    loaddata
    makemessages
    makemigrations
    migrate
    sendtestemail
    shell
    showmigrations
    sqlflush
    sqlmigrate
    sqlsequencereset
    squashmigrations
    startapp
    startproject
    test
    testserver

[sessions]
    clearsessions

[staticfiles]
    collectstatic
    findstatic
    runserver
```







参考

- https://docs.djangoproject.com/en/2.2/intro/tutorial01/
- https://docs.djangoproject.com/en/2.2/ref/django-admin/