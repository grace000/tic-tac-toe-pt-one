require "board"

describe Board do

    describe "#display" do 
        it "should display a board with array of 9 empty strings" do
            board = Board.new
        
            expect(board.display).to eq([" ", " ", " ", " ", " ", " ", " ", " ", " "])
        end
    
    end

end
