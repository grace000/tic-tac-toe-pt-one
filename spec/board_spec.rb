require "board"

describe Board do
    before(:each) do 
        @board = Board.new
    end

    describe "#display" do 
        it "should display a board with no player marks" do
        
            expect(@board.display).to eq(
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

    describe "#empty?" do
        it "returns true if a new board is initialized" do 

            expect(@board.empty?).to eq(true)
        end

        it "returns false if there is one mark on the board" do
            @board.move(0)

            expect(@board.empty?).to eq(false)
        end
    end

    describe "#full?" do
        it "returns true if the board is full" do
            @board.move(0)
            @board.move(1)
            @board.move(2)
            @board.move(3)
            @board.move(4)
            @board.move(5)
            @board.move(6)
            @board.move(7)
            @board.move(8)

            expect(@board.full?).to eq(true)
        end

        it "returns false if the board is not full" do
            @board.move(0)
            @board.move(1)
            @board.move(2)
            @board.move(3)
            @board.move(4)

            expect(@board.full?).to eq(false)
        end
    end
end

