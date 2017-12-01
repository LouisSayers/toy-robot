class Position
  attr_reader :x, :y, :heading

  def initialize(xPos, yPos, heading)
    @x = xPos
    @y = yPos
    @heading = heading
  end

  def ==(other)
    self.state == other.state
  end

  def to_s
    "#{x} #{y} #{heading}"
  end

  protected

  def state
    [@x, @y, @heading]
  end

  class << self
    def for(xPos, yPos, heading)
      heading_obj = Heading.for(heading)
      new(xPos, yPos, heading_obj)
    end
  end

end
