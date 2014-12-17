# GHDLのインストール

Ubuntu 14.04で

```
$ sudo add-apt-repository ppa:pgavin/ghdl
$ sudo apt-get update
$ sudo apt-get install ghdl gtkwave
```

を実行する。 (14.10用のバイナリはまだ用意されてないっぽい？)

# このサンプルの使いかた

helloというサンプルとsampleというサンプルがあります。

```
$ make test
```

で実行されます。

sample.vcdまたはsample.ghwというファイルが生成されます。これをgtkwaveで開くと波形が見られます。
