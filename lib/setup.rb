require_relative './input'
require_relative './prompt'
require_relative './board'
require_relative './input_validator'
require_relative './human_player'
require_relative './game'
require_relative './computer_player'

class Setup
    attr_accessor :board, :players
    def initialize
        @board = Board.new
        @players = []
        @input = Input.new
        @prompt = Prompt.new
    end

    def assign_human_player_token(token_input, player_name_input)
        puts "#{player_name_input}, thanks for selecting #{token_input}."
        player = HumanPlayer.new(token: token_input, name: player_name_input)
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
        computer_player = ComputerPlayer.new(token: computer_token, setting: "Easy")
        @players << computer_player
        computer_token
    end

    def computer_and_human_setup
        human_player_setup
        human_token = @players[0].token
        comp_token = assign_computer_token(human_token)
        @prompt.computer_token(comp_token)
    end

    def human_player_setup
        @prompt.enter_player_name
        player_name = @input.get_player_name
        @prompt.make_token_selection
        selected_token = @input.get_token
        assign_human_player_token(selected_token, player_name)
    end

    def human_players_setup
        @prompt.human_players
        2.times { |player_count|
            puts "PLAYER #{player_count + 1}"
            human_player_setup
        }
    end

    def start_game_engine
        @prompt.welcome
        @prompt.make_opponent_selection
        opponent_selection = @input.get_opponents
        play_with_computer?(opponent_selection)
        Game.new.play(@players, @board)
    end
end



