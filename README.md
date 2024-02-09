## 「n月刊ラムダノート Vol.4, No.1(2024) #3 PicoRubyといっしょに学ぶ、プログラミング言語が電気回路を動かす仕組み」の補足情報

### R2P2（PicoRubyシェル）の入手先

- <https://github.com/picoruby/R2P2/releases>

### 記事中で利用する例題のコードなどの入手先

- PicoUARTのコード全体：
    <https://github.com/LambdaNote/support-picoruby/blob/master/example/pico_uart/pico_uart.rb>

### 補足情報

Wi-Fi機能つきの「Raspberry Pi Pico W」では、`CYW43:GPIO.new` の前に以下が必要になる場合があります（[R2P2 v0.2.1](https://github.com/picoruby/R2P2/releases/tag/0.2.1)以降では不要になりました）。

```rb
irb> require "cyw43"
irb> CYW43.init 
```


