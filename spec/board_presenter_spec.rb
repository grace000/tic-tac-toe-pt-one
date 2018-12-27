require "board_presenter"
require "board"

describe BoardPresenter do
    before(:each) do
        @board_presenter = BoardPresenter.new
    end

    describe "#display_board" do
        it "renders empty board if there are no player marks" do
            board = Board.new

            board.moves.length == 0
            
            expect(@board_presenter.display_board).to eq(
                <<~HEREDOC
                    1    |  2   |   3   
                --------------------------
                    4    |  5   |   6   
                --------------------------
                    7    |  8   |   9  
                HEREDOC
            )
        end
    end
end
