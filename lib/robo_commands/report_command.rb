class ReportCommand < RoboCommand
  include Comms

  def execute(robot, grid)
    super
    output(robot.position)
  end

end
