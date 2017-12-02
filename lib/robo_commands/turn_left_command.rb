class TurnLeftCommand < RoboCommand

  def execute(robot, grid)
    super
    position = robot.position
    return if position.nil?

    heading = position.heading
    new_heading = heading.next_anticlockwise
    new_position = position.create_relative(nil, nil, new_heading)

    robot.move_to(new_position) if grid.position_valid?(new_position)
  end

end
