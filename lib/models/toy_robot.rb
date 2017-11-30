class ToyRobot
  attr_reader :position

  def execute(command, grid)
    command.execute(self, grid)
  end

  def move_to(new_position)
    @position = new_position
  end

end
