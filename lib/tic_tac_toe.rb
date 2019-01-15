require_relative './command_line_in'
require_relative './prompt'
require_relative './board_presenter'
require_relative './board'
require_relative './input_validator'
require_relative './player'

class TicTacToe
    attr_accessor :board 
    attr_reader :player
    def initialize
        @board = Board.new
    end

    def player=(input)
        @player = Player.new(input)
    end

    def get_player_token
        token = CommandLineIn.new.get_input.upcase
        self.player = token
        input_validator = InputValidator.new
        if input_validator.valid_token?(player.token)
            puts "Thanks for selecting #{player.token}. Let's start the game!"
        else
            puts Prompt::RETRY_MAKE_TOKEN_SELECTION
            get_player_token
        end
    end

    def take_turn(board, position)
        input_validator = InputValidator.new
        if input_validator.valid_coordinate?(@board.moves, position)
            @board.move(player.token, position)
        else
            user_coordinate = select_coordinate
            take_turn(user_coordinate)
        end
    end

    def select_coordinate
        puts Prompt::MAKE_COORDINATE_SELECTION
        CommandLineIn.new.get_input.to_i
    end

    def play
        puts Prompt::WELCOME
        puts Prompt::MAKE_TOKEN_SELECTION
        get_player_token
        puts BoardPresenter.new.display_board(board.moves)
        user_coordinate = select_coordinate
        take_turn(@board.moves, user_coordinate)
        puts BoardPresenter.new.display_board(board.moves)
    end
end



