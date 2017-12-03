class CommandProcessor
  include Comms

  def each(&block)
    output('Accepting commands (type QUIT to exit):')

    enum = Enumerator.new do |yielder|
      loop do
        command_str = get_input
        break if command_str == 'QUIT'

        command_data = command_data_for(command_str)
        next if command_data.nil?

        yielder.yield CommandFactory.create_command(command_data)
      end
    end

    enum.each(&block)
  end

  private

  def command_data_for(command_str)
    result = nil
    possible_commands.each do |command, expression|
      if (match = command_str.match(expression))
        result = match.named_captures.merge({'command' => command})
        result = clean_result(result)
        break
      end
    end
    result
  end

  def possible_commands
    {
      place: /PLACE (?<x>\d+),(?<y>\d+),(?<heading>NORTH|EAST|SOUTH|WEST)/,
      left: /^LEFT\Z/,
      right: /^RIGHT\Z/,
      move: /^MOVE\Z/,
      report: /^REPORT\Z/
    }
  end

  def clean_result(result)
    result['x'] = Integer(result['x']) if result['x']
    result['y'] = Integer(result['y']) if result['y']
    result['heading'] = result['heading'].downcase if result['heading']
    result
  end

end
