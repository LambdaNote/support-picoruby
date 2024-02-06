#!/usr/bin/env ruby

require_relative 'mock_gpio'
require_relative 'pico_uart'

rx = PicoUART::RX.new(15)
while true
  print rx.getc.chr
end
