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

    def assign_player_token(token_input, player_name_input)
        puts "#{player_name_input}, thanks for selecting #{token_input}."
        player = Player.new(token: token_input, name: player_name_input)
        @players << player
    end

    def play_with_computer?(input)
        if input == "Y"
            computer_and_human_setup
        else
            human_players_setup
        end 
    end

    def assign_computer_token(human_token)
        computer_token = "X"
        while 
            computer_token == human_token
            computer_token = ("A".."Z").to_a.sample
        end
        player = Player.new(token: computer_token, name: "Computer")
    end

    def computer_and_human_setup
        human_player_setup
        human_token = @players[0].token
        assign_computer_token(human_token)
    end

    def human_player_setup
        @prompt.enter_player_name
        player_name = @input.get_player_name
        @prompt.make_token_selection
        selected_token = @input.get_token
        assign_player_token(selected_token, player_name)
    end

    def human_players_setup
        @prompt.human_players
        2.times { |player_count|
            puts "PLAYER #{player_count + 1}"
            human_player_setup
        }
    end

    def continue_game?(input)
        return if input == "N"
    end

    def start_game_engine
        @prompt.welcome
        @prompt.game_type
        game_type = @input.get_game_type
        play_with_computer?(game_type)
        Game.new.play(@players, @board)
    end
end



