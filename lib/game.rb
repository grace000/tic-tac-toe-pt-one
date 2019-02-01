require_relative './board_presenter'
require_relative './command_line_input'
require_relative './input_validator'
require_relative './prompt'
require_relative './board'
require_relative './game_results'

class Game
    attr_accessor :board 
    def initialize(command_line_input = CommandLineInput.new, prompt = Prompt.new)
        @presenter = BoardPresenter.new
        @game_result = GameResults.new 
        @command_line_input = command_line_input
        @prompt = prompt
    end

    def select_coordinate
        @prompt.make_coordinate_selection
        @command_line_input.get_input.to_i
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

    def game_over?(board, player)
        if @game_result.draw?(board)
            report_game_result(display_draw_message, player=nil)
            puts @presenter.display_board(board.moves)
            return true
        elsif @game_result.winner?(board)
            winner = display_winner_message(player)
            report_game_result(winner, player)
            puts @presenter.display_board(board.moves)
            return true
        else 
            false
        end
    end

    def display_draw_message
        @prompt.draw_message
    end

    def display_winner_message(player)
        @prompt.winner_message(player)
    end

    def report_game_result(result, player)
        result
    end

    def play(players, board)
        players.each { |player| 
            puts "HELLO PLAYER #{player.token}"
            puts @presenter.display_board(board.moves)
            user_coordinate = select_coordinate
            take_turn(board, user_coordinate, player.token)
            return if game_over?(board, player.token)
        }
        play(players, board)
    end
end