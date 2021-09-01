class Player 
  attr_reader :points, :name

  def initialize(name)
    @name = name
    @points = 0
  end

  def won_point
    @points += 1
  end

  def to_s
    @name
  end
end
