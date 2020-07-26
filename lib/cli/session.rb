class Session
  attr_reader :output, :plateau, :current_rover

  def initialize
    self.plateau       = nil
    self.current_rover = nil
    self.output        = []
  end

  def exec_command(command)
    case expected_input
    when "plateau_dimensions"
      create_plateau(command.split_by_spaces)
    when "rover_position"
      create_rover(command.split_by_spaces)
    when "rover_instruction"
      move_rover_and_go_to_the_next(command.split_by_characters)
    end
  end

  def prompt
    case expected_input
    when "plateau_dimensions"
      "Enter plateau dimensions"
    when "rover_position"
      "Enter rover initial position"
    when "rover_instruction"
      "Enter instructions to the rover"
    end
  end

  private

  attr_writer :output, :plateau, :current_rover

  def create_plateau(parsed_input)
    upper_limit = parsed_input[0].to_i
    right_limit = parsed_input[1].to_i

    self.plateau = Plateau.new(upper_limit, right_limit)
  end

  def create_rover(parsed_input)
    x_coordinate = parsed_input[0].to_i
    y_coordinate = parsed_input[1].to_i
    orientation  = parsed_input[2]

    self.current_rover = Rover.new(plateau, x_coordinate, y_coordinate, orientation)
  end

  def move_rover_and_go_to_the_next(parsed_input)
    parsed_input.each do |instruction|
      case instruction
      when "M"
        current_rover.move_forward!
      when "R"
        current_rover.turn_right!
      when "L"
        current_rover.turn_left!
      end
    end

    self.output << "#{current_rover.x_coordinate} #{current_rover.y_coordinate} #{current_rover.orientation}"

    self.current_rover = nil
  end

  def expected_input
    if plateau.nil?
      "plateau_dimensions"
    elsif current_rover.nil?
      "rover_position"
    else
      "rover_instruction"
    end
  end
end