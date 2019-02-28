require "game_results"
require 'board'

describe GameResults do
    before(:each) do
        @game_result = GameResults.new
        @board = Board.new 
    end
    describe "#winner?" do
       
        it "should return false if there are less that 5 updates on the board" do
            @board.update("X", 1)
            @board.update("O", 2)
            @board.update("X", 3)
            @board.update("O", 4)

            expect(@game_result.winner?(@board)).to eq(false)
        end
    end

    describe "#winning_token" do
        it "returns the highest occuring token" do
            @board.update("X", 1)
            @board.update("O", 4)
            @board.update("X", 2)
            @board.update("O", 5)
            @board.update("X", 3)

            expect(@game_result.winning_token(@board)).to eq("X")
        end
    end
    
    describe "#has_winning_combos?" do
        it "returns true if the board's first row has a winning combination" do
            @board.update("X", 1)
            @board.update("X", 2)
            @board.update("X", 3)
            @board.update("O", 4)
            @board.update("O", 5) 

            expect(@game_result.has_winning_combos?(@board)).to eq(true)
        end

        it "returns true if the board's second row has a winning combination" do
            @board.update("O", 1)
            @board.update("X", 4)
            @board.update("X", 5)
            @board.update("X", 6)
            @board.update("O", 7)

            expect(@game_result.has_winning_combos?(@board)).to eq(true)
        end

        it "returns true if the board's third row has a winning combination" do
            @board.update("O", 1)
            @board.update("O", 5)
            @board.update("X", 7)
            @board.update("X", 8)
            @board.update("X", 9) 

            expect(@game_result.has_winning_combos?(@board)).to eq(true)
        end

        it "returns false if the board's first row does not have a winning combination" do
            @board.update("X", 1)
            @board.update("O", 2)
            @board.update("O", 3)

            expect(@game_result.has_winning_combos?(@board)).to eq(false)
        end

        it "returns true if the board's first column has a winning combination" do
            @board.update("X", 1)
            @board.update("O", 5)
            @board.update("X", 4)
            @board.update("X", 7)
            @board.update("O", 9)

            expect(@game_result.has_winning_combos?(@board)).to eq(true)
        end

        it "returns true if the board's second column has a winning combination" do
            @board.update("X", 2)
            @board.update("X", 5)
            @board.update("O", 4)
            @board.update("O", 7)
            @board.update("X", 8)

            expect(@game_result.has_winning_combos?(@board)).to eq(true)
        end

        it "returns true if the board's third column has a winning combination" do
            @board.update("X", 3)
            @board.update("X", 6)
            @board.update("O", 4)
            @board.update("O", 7)
            @board.update("X", 9)

            expect(@game_result.has_winning_combos?(@board)).to eq(true)
        end

        it "returns false if no columns or rows have a winning combination" do
            @board.update("X", 1)
            @board.update("O", 2)
            @board.update("O", 3)
            @board.update("O", 4)
            @board.update("X", 5)
            @board.update("X", 6)
            @board.update("X", 7)
            @board.update("X", 8)
            @board.update("O", 9)

            expect(@game_result.has_winning_combos?(@board)).to eq(false)
        end

        it "returns true if the first diagonal has a winning combination" do
            @board.update("X", 5)
            @board.update("O", 7)
            @board.update("X", 1)
            @board.update("O", 2)
            @board.update("X", 3)
            @board.update("O", 6)
            @board.update("X", 9)

            expect(@game_result.has_winning_combos?(@board)).to eq(true)
        end

        it "returns true if the second diagonal has a winning combination" do
            @board.update("X", 5)
            @board.update("O", 4)
            @board.update("X", 1)
            @board.update("O", 8)
            @board.update("X", 7)
            @board.update("O", 3)
            @board.update("X", 9)

            expect(@game_result.has_winning_combos?(@board)).to eq(true)
        end

        it "returns false if the no columns, rows, or diagonals have a winning combination" do
            @board.update("X", 1)
            @board.update("X", 2)
            @board.update("O", 3)
            @board.update("O", 4)
            @board.update("O", 5)
            @board.update("X", 6)
            @board.update("X", 7)
            @board.update("X", 8)
            @board.update("O", 9)

            expect(@game_result.has_winning_combos?(@board)).to eq(false)
        end
    end
    
    describe "#draw?" do
        it "returns false if the board is empty" do 
            
            expect(@game_result.draw?(@board)).to eq(false)
        end

        it "returns true if the board is full and there is no winner" do
            
            @board.update("X", 1)
            @board.update("O", 2)
            @board.update("X", 3)
            @board.update("O", 4)
            @board.update("X", 5)
            @board.update("X", 6)
            @board.update("O", 7)
            @board.update("X", 8)
            @board.update("O", 9)

            expect(@game_result.draw?(@board)).to eq(true)
        end

        it "returns false if the board is full and there is a winner" do
            
            @board.update("X", 1)
            @board.update("O", 2)
            @board.update("X", 3)
            @board.update("X", 4)
            @board.update("X", 5)
            @board.update("O", 6)
            @board.update("O", 7)
            @board.update("O", 8)
            @board.update("O", 9)

            expect(@game_result.draw?(@board)).to eq(false)
        end

        it "returns false if the board is not full and there is no winner" do

            @board.update("X", 4)
            @board.update("O", 5)
            @board.update("O", 6)
            @board.update("X", 7)
            @board.update("O", 8)

            expect(@game_result.draw?(@board)).to eq(false)
        end
    end 
end