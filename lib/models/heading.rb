class Heading
  NORTH = :north
  EAST = :east
  SOUTH = :south
  WEST = :west
  ALL = [ NORTH, EAST, SOUTH, WEST ]

  def initialize(heading)
    @heading = heading
  end

  def to_s
    @heading.to_s.upcase
  end

  def next_anticlockwise
    next_index = ALL.index(@heading) - 1
    next_at_index(next_index)
  end

  def next_clockwise
    next_index = (ALL.index(@heading) + 1) % ALL.length
    next_at_index(next_index)
  end

  private

  def next_at_index(next_index)
    next_heading_sym = ALL[next_index]
    self.class.for(next_heading_sym)
  end

  class << self
    extend Memoist

    def for(heading)
      return heading if heading.is_a?(Heading)
      raise ArgumentError.new('Unknown heading value given') unless heading_valid?(heading)
      new(heading)
    end
    memoize :for

    private

    def heading_valid?(heading)
      ALL.include?(heading)
    end
  end
end
