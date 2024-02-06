#!/usr/bin/env ruby

require_relative 'mock_gpio'
require_relative 'pico_uart'

tx = PicoUART::TX.new(15)
tx.puts "Hello, world!"
