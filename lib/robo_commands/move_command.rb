class MoveCommand < RoboCommand
  extend Memoist

  def execute(robot, grid)
    super

    position = robot.position
    heading = position.heading

    change_x_by, change_y_by = alterations_for(heading)
    new_position = position.create_relative(change_x_by, change_y_by)

    robot.move_to(new_position) if grid.position_valid?(new_position)
  end

  private

  def alterations_for(heading)
    alterations_by_heading[heading]
  end

  def alterations_by_heading
    alterations.reduce({}) do |new_hash, (heading_sym, alteration)|
      new_hash[Heading.for(heading_sym)] = alteration
      new_hash
    end
  end
  memoize :alterations_by_heading

  def alterations
    {
      Heading::NORTH => [0, 1],
      Heading::EAST => [1, 0],
      Heading::SOUTH => [0, -1],
      Heading::WEST => [-1, 0],
    }
  end

end