require "input_validator"
require 'board'

describe InputValidator do

    before(:each) do
        @input_v = InputValidator.new
    end

    describe "#valid_coordinate?" do
        it "should return true for integers 1 through 9" do

            expect(@input_v.valid_coordinate?(2)).to eq(true)
            expect(@input_v.valid_coordinate?(5)).to eq(true)
        end
        it "should return false for any characters besides integers 1-9" do

            expect(@input_v.valid_coordinate?(0)).to eq(false)
            expect(@input_v.valid_coordinate?("k")).to eq(false)
            expect(@input_v.valid_coordinate?("+")).to eq(false)
            expect(@input_v.valid_coordinate?("/")).to eq(false)
        end      
    end

    describe "#get_invalid_moves" do
        it "should list all positions that have previously been requested" do
            board = Board.new

            board.move(2)
            board.move(3)
            invalid_moves = [2,3]

            expect(@input_v.get_invalid_moves(board)).to eq(invalid_moves)
        end

        it "should list all positions that have previously been requested" do
            board = Board.new

            board.move(2)
            board.move(3)
            board.move(1)
            board.move(4)
            invalid_moves = [2,3,1,4]

            expect(@input_v.get_invalid_moves(board)).to eq(invalid_moves)
        end
    end

    describe "#valid_move?" do
        it "should return false if requested move is already in the board's moves array" do
            board = Board.new

            board.move(2)
            @input_v.get_invalid_moves(board)
            expect(@input_v.valid_move?(2)).to eq(false)
        end

        it "should return false if requested move is already in the board's moves array" do
            board = Board.new

            board.move(2)
            board.move(3)
            board.move(1)
            board.move(4)
            @input_v.get_invalid_moves(board)
            expect(@input_v.valid_move?(2)).to eq(false)
            expect(@input_v.valid_move?(1)).to eq(false)
            expect(@input_v.valid_move?(1)).to eq(false)
            expect(@input_v.valid_move?(4)).to eq(false)
        end

        it "should return true if requested move is not in the board's moves array" do
            board = Board.new

            board.move(1)
            @input_v.get_invalid_moves(board)
            expect(@input_v.valid_move?(3)).to eq(true)
        end

        it "should return true if requested moves are not in the board's moves array" do
            board = Board.new

            board.move(1)
            board.move(4)
            board.move(8)
            @input_v.get_invalid_moves(board)
            expect(@input_v.valid_move?(2)).to eq(true)
            expect(@input_v.valid_move?(3)).to eq(true)
            expect(@input_v.valid_move?(5)).to eq(true)
        end
    end
end