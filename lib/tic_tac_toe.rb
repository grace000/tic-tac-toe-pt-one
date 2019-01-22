require_relative './command_line_in'
require_relative './prompt'
require_relative './board'
require_relative './input_validator'
require_relative './player'
require_relative './game'

class TicTacToe
    attr_accessor :board 
    def initialize
        @board = Board.new
        @players = []
    end

    def assign_player_token(input)
        input_validator = InputValidator.new
        if input_validator.valid_token?(input)
            puts "Thanks for selecting #{input}."
            player = Player.new(input)
            @players << player
        else
            puts Prompt::RETRY_MAKE_TOKEN_SELECTION
            selected_token = CommandLineIn.new.get_input.upcase
            assign_player_token(selected_token)
        end
    end

    def start_game_engine
        puts Prompt::WELCOME
        2.times { |i|
            puts "PLAYER #{i+1}"
            puts Prompt::MAKE_TOKEN_SELECTION
            selected_token = CommandLineIn.new.get_input.upcase
            assign_player_token(selected_token)
        }
        Game.new.play(@players, @board)
    end
end



