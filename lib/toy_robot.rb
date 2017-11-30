class ToyRobot
  attr_accessor :location

  def execute(command, grid)
    command.execute(self, grid)
  end

end
