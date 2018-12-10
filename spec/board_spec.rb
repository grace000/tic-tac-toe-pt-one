require "board"

describe Board do

    describe "#display" do 
        it "should display a board with no player marks" do
            board = Board.new
        
            expect(board.display).to eq(
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



