require "board"

describe Board do
    before(:each) do 
        @board = Board.new
    end

    def setup
        token = "X"
        position = 5
        @board.update(token, position)
    end

    describe "#full?" do
        it "returns true if the board is full" do
            token = "X"
            @board.update(token, 1)
            @board.update(token, 2)
            @board.update(token, 3)
            @board.update(token, 4)
            @board.update(token, 5)
            @board.update(token, 6)
            @board.update(token, 7)
            @board.update(token, 8)
            @board.update(token, 9)

            expect(@board.full?).to eq(true)
        end

        it "returns false if the board is not full" do
            self.setup

            expect(@board.full?).to eq(false)
        end

        it "returns false if the board has any spaces with integers" do
            self.setup
            
            expect(@board.moves.any?(1..9)).to eq(true)
            expect(@board.full?).to eq(false)
        end
    end

    describe "#update" do
        it "updates the board's state with a token at a requested position" do
            self.setup

            expect(@board.moves).to eq([1,2,3,4,"X",6,7,8,9])
        end
    end

    describe "#space_available?" do
        it "returns true if requested space is available on the board" do
            self.setup
            
            expect(@board.space_available?(4)).to eq(true)
        end

        it "returns false if requested space is not available on the board" do
            self.setup
            
            expect(@board.space_available?(5)).to eq(false)
        end
    end

    describe "#empty_spaces" do
        it "returns array of available spaces" do
            token = "X"

            @board.update(token, 1)
            @board.update(token, 2)
            @board.update(token, 3)
            @board.update(token, 4)

            expect(@board.empty_spaces).to eq([5,6,7,8,9])
        end
    end
end

