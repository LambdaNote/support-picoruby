if RUBY_ENGINE == 'mruby/c'
  require 'gpio'
else
  require_relative 'mock_gpio'
end

class PicoUART
  DELAY_MS = 8
  FEED = "\n"
  FEED_ORD = FEED.ord

  class TX
    def initialize(pin_num)
      @pin = GPIO.new(pin_num, GPIO::OUT)
      @pin.write 1
    end

    def puts(str)
      print str + FEED
      nil
    end

    def print(str)
      str.each_byte do |byte|
        write_byte byte
      end
      nil
    end

    # private

    def write_byte(byte)
      # start bit
      @pin.write 0
      sleep_ms DELAY_MS
      8.times do
        @pin.write(byte & 1)
        byte >>= 1
        sleep_ms DELAY_MS
      end
      # stop bits
      @pin.write 1
      sleep_ms DELAY_MS
    end
  end

  class RX
    def initialize(pin_num)
      @pin = GPIO.new(pin_num, GPIO::IN)
      @pin.set_pull(GPIO::PULL_UP)
    end

    def getbyte
      byte = 0
      # wait for start bit
      while @pin.read == 1
      end
      sleep_ms(DELAY_MS + 1)
      8.times do
        byte >>= 1
        byte |= 0x80 if @pin.read == 1
        sleep_ms DELAY_MS
      end
      if @pin.read == 0
        puts
        puts 'stop bit error'
      end
      byte
    end

    def gets
      str = ''
      loop do
        byte = getbyte
        str << byte.chr
        break if byte == FEED_ORD
      end
      str
    end
  end
end
