module Comms

  def output(str)
    Comms.output.puts(str)
  end

  class << self
    extend Memoist

    def set_output(out)
      @output = out
      output(true) # rememoize
    end

    def output
      @output ||= STDOUT
    end
    memoize :output
  end

end
