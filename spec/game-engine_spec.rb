require "game_engine"

describe GameEngine do
    before(:each) do
        @game = GameEngine.new
    end

    describe "#display_board" do
        it "displays a board with no player marks" do

            expect(@game.display_board).to eq(
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

    describe "#start" do
    end
end