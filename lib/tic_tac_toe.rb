require_relative './command_line_in'
require_relative './prompt'
require_relative './board_presenter'
require_relative './board'
require_relative './input_validator'

class TicTacToe
    @@selected_token
    @@selected_move
    
    attr_accessor :board, :board_presenter, :input_validator

    def initialize
        @board = Board.new
        @board_presenter = BoardPresenter.new
        @input_validator = InputValidator.new
    end

    def welcome_player
        puts Prompt::WELCOME
        puts Prompt::MAKE_TOKEN_SELECTION
        @@selected_token = CommandLineIn.new.get_input.upcase
        if input_validator.valid_token?(@@selected_token)
            puts "Thanks for selecting #{@@selected_token}. Let's start the game!"
        else
            welcome_player
        end
    end

    def play
        welcome_player
        puts board_presenter.display_board(board.moves)
        select_coordinate
        take_turn(@@selected_move, @@selected_token)
        puts board_presenter.display_board(board.moves)
    end

    def take_turn(position, token)
        if input_validator.valid_coordinate?(position)
            board.move(token, position)
        else
            select_coordinate
            take_turn(@@selected_move, @@selected_token)
        end
    end

    def select_coordinate
        puts Prompt::MAKE_COORDINATE_SELECTION
        @@selected_move = CommandLineIn.new.get_input.to_i
    end
end



