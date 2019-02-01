require "board"

describe Board do
    before(:each) do 
        @board = Board.new
    end

    describe "#full?" do
        it "returns true if the board is full" do
            token = "X"
            @board.move(token, 1)
            @board.move(token, 2)
            @board.move(token, 3)
            @board.move(token, 4)
            @board.move(token, 5)
            @board.move(token, 6)
            @board.move(token, 7)
            @board.move(token, 8)
            @board.move(token, 9)

            expect(@board.full?).to eq(true)
        end

        it "returns false if the board is not full" do
            token = "X"
            @board.move(token, 5)

            expect(@board.full?).to eq(false)
        end

        it "returns false if the board has any spaces with integers" do
            token = "X"
            @board.move(token, 5)
            
            expect(@board.moves.any?(1..9)).to eq(true)
            expect(@board.full?).to eq(false)
        end
    end
end

