class ControlCenter

  def initialize(commands, grid, robot)
    @commands = commands
    @grid = grid
    @robot = robot
  end

  def engage
    @commands.each do |command|
      @robot.execute(command, @grid)
    end
  end

end
