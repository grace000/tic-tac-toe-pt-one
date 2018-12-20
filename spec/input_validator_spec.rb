require "input_validator"
require 'board'

describe InputValidator do

    before(:each) do
        @input_v = InputValidator.new
    end

    describe "#valid_character?" do
        it "should return true for integers 1 through 9" do

            expect(@input_v.valid_character?(2)).to eq(true)
            expect(@input_v.valid_character?(5)).to eq(true)
        end
        it "should return false for any characters besides integers 1-9" do

            expect(@input_v.valid_character?(0)).to eq(false)
            expect(@input_v.valid_character?("k")).to eq(false)
            expect(@input_v.valid_character?("+")).to eq(false)
            expect(@input_v.valid_character?("/")).to eq(false)
        end      
    end

    describe "#get_invalid_moves" do
        xit "should list all positions that have previously been requested" do
            board = Board.new

            board.move(2)
            board.move(3)
            invalid_moves = [2,3]

            expect(@input_v.get_invalid_moves).to eq(invalid_moves)
        end
    end

    describe "#valid_move?" do
        xit "should return false if requested move is already in the board's moves array" do
            board = Board.new

            board.move(2)

            expect(@input_v.valid_move?(2, board)).to eq(false)
        end
    end
end