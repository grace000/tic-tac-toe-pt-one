require_relative './command_line_in'
require_relative './prompt'
require_relative './board_presenter'
require_relative './board'
require_relative './input_validator'
require_relative './player'

class TicTacToe
    attr_accessor :board, :board_presenter, :input_validator
    attr_reader :player
    def initialize
        @board = Board.new
        @board_presenter = BoardPresenter.new
        @input_validator = InputValidator.new
    end

    def player=(input)
        @player = Player.new(input)
    end

    def welcome_player
        puts Prompt::WELCOME
        puts Prompt::MAKE_TOKEN_SELECTION
        token = CommandLineIn.new.get_input.upcase
        self.player = token
        if input_validator.valid_token?(player.token)
            puts "Thanks for selecting #{player.token}. Let's start the game!"
        else
            welcome_player
        end
    end

    def take_turn(position)
        if input_validator.valid_coordinate?(position) && input_validator.valid_move?(board.moves, position)
            board.move(player.token, position)
        else
            select_coordinate
            take_turn(position)
        end
    end

    def select_coordinate
        puts Prompt::MAKE_COORDINATE_SELECTION
        CommandLineIn.new.get_input.to_i
    end

    def play
        welcome_player
        puts board_presenter.display_board(board.moves)
        user_coordinate = select_coordinate
        take_turn(user_coordinate)
        puts board_presenter.display_board(board.moves)
    end
end



