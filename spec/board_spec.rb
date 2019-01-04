require "board"

describe Board do
    before(:each) do 
        @board = Board.new
    end

    describe "#empty?" do
        it "returns true if a new board is initialized" do 

            expect(@board.empty?).to eq(true)
        end

        it "returns false if there is one mark on the board" do
            token = "X"
            position = 0
            @board.move(token, position)

            expect(@board.empty?).to eq(false)
        end
    end

    describe "#full?" do
        it "returns true if the board is full" do
            token = "X"
            @board.move(token, 0)
            @board.move(token, 1)
            @board.move(token, 2)
            @board.move(token, 3)
            @board.move(token, 4)
            @board.move(token, 5)
            @board.move(token, 6)
            @board.move(token, 7)
            @board.move(token, 8)

            expect(@board.full?).to eq(true)
        end

        it "returns false if the board is not full" do
            token = "X"
            @board.move(token, 0)
            @board.move(token, 1)
            @board.move(token, 2)
            @board.move(token, 3)
            @board.move(token, 4)

            expect(@board.full?).to eq(false)
        end
    end
end

