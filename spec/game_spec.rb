require 'game'
require 'command_line_input'
require 'easy_computer_player'

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
    describe "#take_turn" do
        it "takes a coordinate from user and places it on the board" do
            game = Game.new
            board = Board.new
            player = EasyComputerPlayer.new(token: "X", setting: "Easy")
            game.take_turn(board, 1, player)
            expect(board.moves[0]).to eq("X")
        end
    end
end