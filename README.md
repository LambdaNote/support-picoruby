## 「n月刊ラムダノート Vol.4, No.1(2024) #3 PicoRubyといっしょに学ぶ、プログラミング言語が電気回路を動かす仕組み」の補足情報

### 記事中で利用する例題のコードなど

- PicoUARTのコード全体：
    <https://github.com/LambdaNote/support-picoruby/blob/master/example/pico_uart/pico_uart.rb>

### 補足情報

Wi-Fi機能つきの「Raspberry Pi Pico W」では、`CYW43:GPIO.new` の前に以下が必要になる場合があります。

```rb
irb> require "cyw43"
irb> CYW43.init 
```


