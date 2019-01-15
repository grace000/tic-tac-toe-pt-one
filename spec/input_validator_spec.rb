require "input_validator"
require 'board'

describe InputValidator do

    before(:each) do
        @input_v = InputValidator.new
    end

    describe "#valid_coordinate?" do
        before(:each) do
            @board = Board.new
        end

        it "should return true for integers 1 through 9" do

            expect(@input_v.valid_coordinate?(@board.moves, 2)).to eq(true)
            expect(@input_v.valid_coordinate?(@board.moves, 5)).to eq(true)
        end

        it "should return false for any characters besides integers 1-9" do

            expect(@input_v.valid_coordinate?(@board.moves, 0)).to eq(false)
            expect(@input_v.valid_coordinate?(@board.moves, "k")).to eq(false)
            expect(@input_v.valid_coordinate?(@board.moves, "+")).to eq(false)
            expect(@input_v.valid_coordinate?(@board.moves, "/")).to eq(false)
        end
        
        it 'should return false for integers that have been previously requested' do
            token = "X"
            
            @board.move(token, 2)

            expect(@input_v.valid_coordinate?(@board.moves, 2)).to eq(false)
        end
    end

    describe "#valid_token?" do
        it "should return false if token is not a letter from A to Z" do
            
            expect(@input_v.valid_token?("3")).to eq(false)
        end

        it "should return false if token is a blank character" do
            
            expect(@input_v.valid_token?(" ")).to eq(false)
        end

        it "should return false if token is nil" do
            
            expect(@input_v.valid_token?(nil)).to eq(false)
        end

        it "should return false if token is more than one character in length" do
            
            expect(@input_v.valid_token?("DF")).to eq(false)
        end

        it "should return true if token is a letter from A to Z" do
            
            expect(@input_v.valid_token?("X")).to eq(true)
            expect(@input_v.valid_token?("G")).to eq(true)
        end
    end
end