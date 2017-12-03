class CommandFactory

  class << self
    def create_command(args)
      case args['command']
        when :place then create_place_command(args)
        when :left then TurnLeftCommand.new
        when :right then TurnRightCommand.new
        when :move then MoveCommand.new
        when :report then ReportCommand.new
        else raise ArgumentError.new('Unknown command')
      end
    end

    private

    def create_place_command(args)
      heading = Heading.for(args['heading'].to_sym)
      PlaceCommand.new(args['x'], args['y'], heading)
    end
  end

end
