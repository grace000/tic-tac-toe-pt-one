require 'game'
require 'board_presenter'
require 'player'
require 'board'

describe Game do
    describe "#play" do
        xit "continues game if game is not over" do
            board = BoardPresenter.new
            game = Game.new(board)

            allow(Game).to 

            expect(game.play(players, board)).to eq(true)
        end
    end
end