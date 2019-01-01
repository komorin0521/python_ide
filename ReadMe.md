# Overview
neovimを用いた開発環境をdokcerファイルにしたもの
ホストマシンの"/opt/pyenv"にpyenvおよびpyenv-virtualenvをインストールしていることを前提としている
上記の前提を満たしていない場合はdockerファイルのpyenvのPATHの定義部分を変更してご利用ください(ただし、動作未検証）

# build

```
$ docker build -t python_ide .
```

# run

$ docker run -it --rm -v /opt/pyenv:/opt/pyenv -v /home:/home python_ide $PWD/(filename) # <- which you want to edit
```
