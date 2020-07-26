class Rover
  attr_reader :plateau, :x_coordinate, :y_coordinate, :orientation

  def initialize(plateau, x_coordinate, y_coordinate, orientation)
    @plateau      = plateau
    @x_coordinate = x_coordinate
    @y_coordinate = y_coordinate
    @orientation  = orientation
  end

  def move_forward!
    case orientation
    when "N"
      move_north!
    when "S"
      move_south!
    when "E"
      move_east!
    when "W"
      move_west!
    end
  end

  def turn_left!
    case orientation
    when "N"
      self.orientation = "W"
    when "S"
      self.orientation = "E"
    when "E"
      self.orientation = "N"
    when "W"
      self.orientation = "S"
    end
  end

  def turn_right!
    case orientation
    when "W"
      self.orientation = "N"
    when "E"
      self.orientation = "S"
    when "N"
      self.orientation = "E"
    when "S"
      self.orientation = "W"
    end
  end

  private

  attr_writer :y_coordinate, :x_coordinate, :orientation

  def move_north!
    self.y_coordinate += 1
  end

  def move_south!
    self.y_coordinate -= 1
  end

  def move_east!
    self.x_coordinate += 1
  end

  def move_west!
    self.x_coordinate -= 1
  end
end