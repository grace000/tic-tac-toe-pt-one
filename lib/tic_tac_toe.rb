require_relative './command_line_in'
require_relative './input'
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
        puts "Thanks for selecting #{input}."
        player = Player.new(input)
        @players << player
    end

    # def select_player_token
    #     Input.new
    # end

    def start_game_engine
        puts Prompt::WELCOME
        2.times { |i|
            puts "PLAYER #{i+1}"
            puts Prompt::MAKE_TOKEN_SELECTION
            cli_input = CommandLineIn.new
            selected_token = Input.new(cli_input).get_token
            assign_player_token(selected_token)
        }
        Game.new.play(@players, @board)
    end
end



