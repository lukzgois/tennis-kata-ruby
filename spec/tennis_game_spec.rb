require_relative '../tennis_game'
require_relative '../player'

RSpec.describe TennisGame do
  let(:player1) { Player.new('Julia') }
  let(:player2) { Player.new('Leo') }
  let(:subject) { TennisGame.new(player1, player2) }

  context 'when no points are earned' do
    it 'scores a Love-Love game' do
      expect(subject.score).to eq('Love-Love')
    end
  end

  context 'when player one scores' do
    context 'when the player scores a point' do
      it 'scores a Fifteen-Love game' do 
        player1.won_point

        expect(subject.score).to eq('Fifteen-Love')
      end
    end

    context 'when the player scores two points' do
      it 'scores a Thirty-Love game' do 
        2.times { player1.won_point }

        expect(subject.score).to eq('Thirty-Love')
      end
    end

    context 'when the player scores three points' do
      it 'scores a Forty-Love game' do 
        3.times { player1.won_point }

        expect(subject.score).to eq('Forty-Love')
      end
    end

    context 'when the player scores four points' do
      it 'prints the winner' do
        4.times { player1.won_point }

        expect(subject.score).to eq('Julia is the winner!')
      end
    end
  end

  context 'when player two scores' do
    context 'when the player scores a point' do
      it 'scores a Love-Fifteen game' do 
        player2.won_point

        expect(subject.score).to eq('Love-Fifteen')
      end
    end

    context 'when the player scores two points' do
      it 'scores a Love-Thirty game' do 
        2.times { player2.won_point }

        expect(subject.score).to eq('Love-Thirty')
      end
    end

    context 'when the player scores three points' do
      it 'scores a Love-Forty game' do 
        3.times { player2.won_point }

        expect(subject.score).to eq('Love-Forty')
      end
    end

    context 'when the player scores four points' do
      it 'prints the winner' do
        4.times { player2.won_point }

        expect(subject.score).to eq('Leo is the winner!')
      end
    end
  end

  context 'when both player have 3 points' do
    it 'scores a deuce' do
      3.times { player1.won_point }
      3.times { player2.won_point }

      expect(subject.score).to eq('Deuce')
    end
  end

  context 'when a player has advantage' do
    it 'scores the advantage' do
      3.times { player2.won_point }
      4.times { player1.won_point }

      expect(subject.score).to eq('Advantage for Julia!')
    end

    context 'and the other player scores a point' do
      it 'scores a deuce again' do
        4.times { player2.won_point }
        4.times { player1.won_point }

        expect(subject.score).to eq('Deuce')
      end

      context 'and the other player scores another point' do
        it 'scores advantage again' do
          4.times { player1.won_point }
          5.times { player2.won_point }

          expect(subject.score).to eq('Advantage for Leo!')
        end
      end
    end

    context 'and the player scores two points' do
      it 'wins the game' do
        3.times { player1.won_point }
        5.times { player2.won_point }

        expect(subject.score).to eq('Leo is the winner!')
      end
    end
  end
end
