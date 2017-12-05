module Comms

  def output(str)
    Comms.output.puts(str)
  end

  def get_input
    Comms.input.gets.chomp
  end

  class << self
    def set_output(out)
      @output = out
    end

    def set_input(io_in)
      @input = io_in
    end

    def output
      @output ||= STDOUT
    end

    def input
      @input ||= STDIN
    end
  end

end
