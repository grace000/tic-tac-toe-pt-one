require "board_presenter"

describe BoardPresenter do
    before(:each) do
        @board_presenter = BoardPresenter.new
    end

    describe "#display_board" do
        it "renders empty board if there are no player marks" do
            
            expect(@board_presenter.display_board).to eq(
                <<~HEREDOC
                        |      |      
                --------------------------
                        |      |      
                --------------------------
                        |      |     
                HEREDOC
            )
        end
    end
end
