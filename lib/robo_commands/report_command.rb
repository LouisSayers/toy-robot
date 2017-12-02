class ReportCommand < RoboCommand
  include Comms

  def execute(robot, grid)
    super

    position = robot.position
    return if position.nil?

    output(position)
  end

end
