require "board_presenter"
require "board"

describe BoardPresenter do
    before(:each) do
        @board_presenter = BoardPresenter.new
    end

    describe "#display_board" do
        it "renders empty board if there are no player marks" do
            board = Board.new
            expect(@board_presenter.display_board(board.moves)).to eq(
            <<~HEREDOC
            \n
                1    |   2   |    3
              --------------------------\n
                4    |   5   |    6
              --------------------------\n
                7    |   8   |    9\n   
            HEREDOC
            )
        end
    end
end
