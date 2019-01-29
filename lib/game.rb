require_relative './board_presenter'
require_relative './command_line_input'
require_relative './input_validator'
require_relative './prompt'
require_relative './board'
require_relative './game_results'

class Game
    attr_accessor :board 
    def initialize
        @presenter = BoardPresenter.new
        @game_result = GameResults.new 
    end

    def select_coordinate
        puts Prompt::MAKE_COORDINATE_SELECTION
        CommandLineInput.new.get_input.to_i
    end

    def take_turn(board, position, token)
        input_validator = InputValidator.new
        if input_validator.valid_coordinate?(board.moves, position)
            board.move(token, position)
        else
            user_coordinate = select_coordinate
            take_turn(board, user_coordinate, token)
        end
    end

    def game_over?(board)
        if @game_result.draw?(board)
            report_game_result
            puts @presenter.display_board(board.moves)
            return true
        end
    end

    def report_game_result
        puts "It's a draw! Game over!"
    end

    def play(players, board)
        players.each { |player| 
            puts "HELLO PLAYER #{player.token}"
            puts @presenter.display_board(board.moves)
            user_coordinate = select_coordinate
            take_turn(board, user_coordinate, player.token)
            return if game_over?(board)
        }
        play(players, board)
    end
end