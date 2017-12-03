module Comms

  def output(str)
    Comms.output.puts(str)
  end

  def get_input
    Comms.input.gets.chomp
  end

  class << self
    extend Memoist

    def set_output(out)
      @output = out
      output(true) # rememoize
    end

    def set_input(io_in)
      @input = io_in
      input(true) # rememoize
    end

    def output
      @output ||= STDOUT
    end
    memoize :output

    def input
      @input ||= STDIN
    end
    memoize :input
  end

end
