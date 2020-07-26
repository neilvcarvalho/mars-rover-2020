class Plateau
  attr_reader :upper_limit, :right_limit, :rovers

  def initialize(upper_limit, right_limit)
    @upper_limit = upper_limit
    @right_limit = right_limit
    @rovers      = []
  end
end