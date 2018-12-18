require "board"

describe Board do
    describe "#empty?" do
        it "returns true if a new board is initialized" do 
            board = Board.new

            expect(board.empty?).to eq(true)
        end

        it "returns false if there is one mark on the board" do
            board = Board.new

            board.move(0)

            expect(board.empty?).to eq(false)
        end
    end

    describe "#full?" do
        it "returns true if the board is full" do
            board = Board.new

            board.move(0)
            board.move(1)
            board.move(2)
            board.move(3)
            board.move(4)
            board.move(5)
            board.move(6)
            board.move(7)
            board.move(8)

            expect(board.full?).to eq(true)
        end

        it "returns false if the board is not full" do
            board = Board.new

            board.move(0)
            board.move(1)
            board.move(2)
            board.move(3)
            board.move(4)

            expect(board.full?).to eq(false)
        end
    end
end

