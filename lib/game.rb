require_relative './board_presenter'
require_relative './input'
require_relative './input_validator'
require_relative './prompt'
require_relative './board'
require_relative './game_results'

class Game
    attr_accessor :board 
    def initialize
        @presenter = BoardPresenter.new
        @game_result = GameResults.new 
        @prompt = Prompt.new

    end

    def take_turn(board, position, player)
        board.update(player.token, position)
    end

    def game_over?(board)
        @game_result.winner?(board) || @game_result.draw?(board)
    end

    def display_draw_message
        @prompt.draw_message
    end

    def display_winner_message(player)
        @prompt.winner_message(player)
    end

    def report_game_result(player, board)
        if @game_result.draw?(board)
           display_draw_message
        elsif @game_result.winner?(board)
            display_winner_message(player)
        end
        puts @presenter.display_board(board.moves)
    end

    def play(players, board)
        players.each { |player| 
            puts "Alright, #{player.name}, please take your turn."
            puts @presenter.display_board(board.moves)
            user_coordinate = player.select_coordinate(board, players)
            print player
            take_turn(board, user_coordinate, player)
            return report_game_result(player.name, board) if game_over?(board)
        }
        play(players, board)
    end
end