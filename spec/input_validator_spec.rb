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

    describe "#valid_move?" do
        before(:each) do
            @board = Board.new
        end

        it "should return false if requested move is already in the board's moves array" do
            token = "X"
            @board.move(token, 2)
            
            expect(@input_v.valid_move?(@board.moves, 2)).to eq(false)
        end

        it "should return true if requested move is not in the board's moves array" do
            token = "X"
            @board.move(token, 1)
            @board.move(token, 5)

            expect(@input_v.valid_move?(@board.moves, 3)).to eq(true)
        end

    end

    describe "#valid_token?" do
        it "should return false if token is not X or O" do
            
            expect(@input_v.valid_token?("P")).to eq(false)
            expect(@input_v.valid_token?("3")).to eq(false)
            expect(@input_v.valid_token?("M")).to eq(false)
        end

        it "should return true if token is X or O" do
            
            expect(@input_v.valid_token?("X")).to eq(true)
            expect(@input_v.valid_token?("O")).to eq(true)
        end
    end
end