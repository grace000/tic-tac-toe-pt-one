require_relative './input'
require_relative './prompt'
require_relative './board'
require_relative './input_validator'
require_relative './human_player'
require_relative './game'
require_relative './easy_computer_player'
require_relative './hard_computer_player'

class Setup
    attr_accessor :board, :players
    def initialize
        @board = Board.new
        @players = []
        @input = Input.new
        @prompt = Prompt.new
        @number_of_players = 2
    end

    def start_game_engine(game)
        @prompt.welcome
        @number_of_players.times { @players << get_player_selection }
        game.play(@players, @board)
    end

    private 

    def assign_human_player_info(token_input, player_name_input)
        @prompt.confirm_player_info(player_name_input, token_input)
        HumanPlayer.new(token: token_input, name: player_name_input, board: @board)
    end

    def assign_easy_computer_player
        EasyComputerPlayer.new(token: "E", board: @board)
    end

    def assign_hard_computer_player
        HardComputerPlayer.new(token: "Z", board: @board)
    end

    def human_player_setup
        @prompt.enter_player_name
        player_name = @input.get_player_name
        @prompt.make_token_selection
        selected_token = @input.get_token
        assign_human_player_info(selected_token, player_name)
    end

    def get_player_selection
        @prompt.player_selection(@number_of_players)

        player_type = @input.get_players
        
        if player_type == "H"
            human_player_setup
        elsif player_type == "E"
            assign_easy_computer_player
        else
            assign_hard_computer_player
        end
    end
end



