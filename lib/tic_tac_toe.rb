require_relative './command_line_in'
require_relative './prompt'
require_relative './board_presenter'
require_relative './board'

class TicTacToe
    attr_accessor :board, :board_presenter
    def initialize
        @board = Board.new
        @board_presenter = BoardPresenter.new
    end

    def welcome_player
        puts Prompt::WELCOME
        CommandLineIn.new.get_input
        puts Prompt::MAKE_TOKEN_SELECTION
    end

    def play
        welcome_player
        selected_token = CommandLineIn.new.get_input
        puts "Thanks for selecting #{selected_token}. Let's start the game!" 
        puts board_presenter.display_board(board.moves)
        puts Prompt::MAKE_COORDINATE_SELECTION
        selected_move = CommandLineIn.new.get_input.to_i
        take_turn(selected_move, selected_token)
        puts board_presenter.display_board(board.moves)
    end

    def take_turn(position, token)
        board.move(token, position)
    end
end



