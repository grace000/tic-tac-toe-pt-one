require_relative './input'
require_relative './prompt'
require_relative './board'
require_relative './input_validator'
require_relative './player'
require_relative './game'

class Setup
    attr_accessor :board 
    def initialize
        @board = Board.new
        @players = []
        @input = Input.new
        @prompt = Prompt.new
    end

    def assign_player_token(input)
        puts "Thanks for selecting #{input}."
        player = Player.new(input)
        @players << player
    end

    def start_game_engine
        @prompt.welcome
        2.times { |player_count|
            puts "PLAYER #{player_count + 1}"
            @prompt.make_token_selection
            selected_token = @input.get_token
            assign_player_token(selected_token)
        }
        Game.new.play(@players, @board)
    end
end



