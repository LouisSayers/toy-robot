class Heading
  NORTH = :north
  EAST = :east
  SOUTH = :south
  WEST = :west
  ALL = [ NORTH, EAST, SOUTH, WEST ]

  def initialize(heading)
    @heading = heading
  end

  class << self
    extend Memoist

    def for(heading)
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