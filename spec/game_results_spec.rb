require "game_results"
require 'board'

describe GameResults do
    before(:all) do
        @game_result = GameResults.new
        @board = Board.new 
    end
    describe "#winner?" do
        
        it "should return false if there are less that 5 moves on the board" do
            @board.move("X", 1)
            @board.move("O", 2)
            @board.move("X", 3)
            @board.move("O", 4)

            expect(@game_result.winner?(@board)).to eq(false)
        end
    end 
    
    describe "#draw?" do
        before(:each) do
            @board = Board.new 
            @result = GameResults.new
        end

        it "returns false if the board is empty" do 
            
            expect(@result.draw?(@board)).to eq(false)
        end

        it "returns true if the board is full and there is no winner" do
            
            @board.move("X", 1)
            @board.move("O", 2)
            @board.move("X", 3)
            @board.move("O", 4)
            @board.move("X", 5)
            @board.move("X", 6)
            @board.move("O", 7)
            @board.move("X", 8)
            @board.move("O", 9)

            expect(@result.draw?(@board)).to eq(true)
        end

        it "returns false if the board is full and there is a winner" do
            
            @board.move("X", 1)
            @board.move("X", 2)
            @board.move("X", 3)
            @board.move("X", 4)
            @board.move("O", 5)
            @board.move("O", 6)
            @board.move("X", 7)
            @board.move("O", 8)
            @board.move("O", 9)

            expect(@result.draw?(@board)).to eq(false)
        end

        it "returns false if the board is not full and there is no winner" do

            @board.move("X", 4)
            @board.move("O", 5)
            @board.move("O", 6)
            @board.move("X", 7)
            @board.move("O", 8)

            expect(@result.draw?(@board)).to eq(false)
        end
    end 
    
    describe "#winning_combos" do 
        it "should return an array with winning rows,cols,diags" do
            result = GameResults.new

            combo_array = [
                [0,1,2],
                [3,4,5],
                [6,7,8],
                [0,3,6],
                [1,4,7],
                [2,5,8],
                [0,4,8],
                [2,4,6]
            ]

            expect(result.winning_combos).to eq(combo_array)
        end
    
    end
    
end