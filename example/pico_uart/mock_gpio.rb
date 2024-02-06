module Kernel
  def sleep_ms(ms)
    sleep(ms / 1000.0)
  end
end

class GPIO
  OUT = :out
  IN = :in
  PULL_UP = :pull_up

  def initialize(pin, dir)
    @fname = "./gpio#{pin}"
    @dir = dir
  end

  def set_pull(_pull)
    File.write(@fname, 1)
  end

  def write(val)
    raise StandardError, 'Not an output' unless @dir == OUT
    raise ArgumentError, 'Invalid value' unless val == 0 || val == 1
    File.write(@fname, val)
  end

  def read
    raise StandardError, 'Not an input' unless @dir == IN
    File.exist?(@fname) ? File.read(@fname).to_i : 1
  end
end

