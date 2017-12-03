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
    "#{x},#{y},#{heading}"
  end

  def create_relative(x_change, y_change = nil, new_heading = nil)
    new_x = x + ( x_change || 0 )
    new_y = y + ( y_change || 0 )
    new_heading ||= heading
    self.class.for(new_x, new_y, new_heading)
  end

  protected

  def state
    [ @x, @y, @heading ]
  end

  class << self
    def for(xPos, yPos, heading)
      heading_obj = Heading.for(heading)
      new(xPos, yPos, heading_obj)
    end
  end

end
