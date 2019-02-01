require 'game'
require 'command_line_input'

class MockCommandLineInput
    def initialize(input)
        @input = input
    end

    def get_input
        @input
    end
end

class MockPrompt
    def make_coordinate_selection
    end
end

describe Game do
    describe "#select_coordinate" do
        it "returns valid user input" do
            game = Game.new(MockCommandLineInput.new(7), MockPrompt.new)
            coordinate = game.select_coordinate
            expect(coordinate).to eq(7)
        end
    end
    
    describe "#take_turn" do
        it "takes a coordinate from user and places it on the board" do
            game = Game.new
            board = Board.new
            game.take_turn(board, 1, "X")
            expect(board.moves[0]).to eq("X")
        end

        it "prompts for new input after receiving invalid input" do
            game = Game.new(MockCommandLineInput.new(7), MockPrompt.new)
            board = Board.new
            game.take_turn(board, "B", "X")
            expect(board.moves[6]).to eq("X")
        end
    end
end