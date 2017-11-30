class PlaceCommand < RoboCommand

  def initialize(xPos, yPos, heading)
    @position = Position.for(xPos, yPos, heading)
  end

  def execute(robot, grid)
    super
    robot.move_to(@position) if grid.position_valid?(@position)
  end

end
