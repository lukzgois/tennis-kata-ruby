class TennisGame
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
  end

  SCORE_LOOKUP = {
    0 => 'Love',
    1 => 'Fifteen',
    2 => 'Thirty',
    3 => 'Forty'
  }.freeze

  def score
    return "#{leader} is the winner!" if winner?
    return 'Deuce' if deuce?
    return "Advantage for #{leader}!" if advantage?

    "#{SCORE_LOOKUP[@player1.points]}-#{SCORE_LOOKUP[@player2.points]}"
  end

  def enough_points?
    [@player1.points, @player2.points].max >= 4
  end

  def leading_by_two?
    (@player1.points - @player2.points).abs >= 2
  end

  def winner?
    enough_points? && leading_by_two?
  end

  def leader
    return @player1 if @player1.points > @player2.points

    @player2
  end

  def same_points?
    @player1.points == @player2.points
  end

  def more_than_three_points?
    @player1.points >= 3 && @player2.points >= 3
  end

  def deuce?
     more_than_three_points? && same_points? 
  end

  def advantage?
    more_than_three_points? && !same_points?
  end
end
