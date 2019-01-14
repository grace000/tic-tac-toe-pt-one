require_relative './command_line_in'
require_relative './prompt'
require_relative './board_presenter'
require_relative './board'
require_relative './input_validator'
require_relative './player'

class TicTacToe
    @@selected_token
    @@selected_move
    
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

    def play
        welcome_player
        puts board_presenter.display_board(board.moves)
        select_coordinate
        take_turn(player.token, @@selected_move)
        puts board_presenter.display_board(board.moves)
    end

    def take_turn(token, position)
        if input_validator.valid_coordinate?(position) && input_validator.valid_move?(board.moves, position)
            board.move(player.token, @@selected_move)
        else
            select_coordinate
            take_turn(player.token, @@selected_move)
        end
    end

    def select_coordinate
        puts Prompt::MAKE_COORDINATE_SELECTION
        @@selected_move = CommandLineIn.new.get_input.to_i
    end
end



