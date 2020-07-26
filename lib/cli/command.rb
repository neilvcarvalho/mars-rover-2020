class Command
  attr_reader :input

  def initialize(input)
    @input = input.strip
  end

  def split_by_spaces
    input.split(" ")
  end

  def split_by_characters
    input.split(//)
  end
end