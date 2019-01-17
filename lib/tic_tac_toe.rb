require_relative './command_line_in'
require_relative './prompt'
require_relative './board_presenter'
require_relative './board'
require_relative './input_validator'
require_relative './player'

class TicTacToe
    attr_accessor :board 
    def initialize
        @board = Board.new
        @presenter = BoardPresenter.new
        @players = []
    end

    def assign_player_token(input)
        input_validator = InputValidator.new
        if input_validator.valid_token?(input)
            puts "Thanks for selecting #{input}."
            player = Player.new(input)
            @players << player
        else
            puts Prompt::RETRY_MAKE_TOKEN_SELECTION
            selected_token = CommandLineIn.new.get_input.upcase
            assign_player_token(selected_token)
        end
    end

    def select_coordinate
        puts Prompt::MAKE_COORDINATE_SELECTION
        CommandLineIn.new.get_input.to_i
    end

    def take_turn(board, position, token)
        input_validator = InputValidator.new
        if input_validator.valid_coordinate?(@board.moves, position)
            @board.move(token, position)
        else
            user_coordinate = select_coordinate
            take_turn(@board.moves, user_coordinate, token)
        end
    end

    def start_game_engine
        puts Prompt::WELCOME
        2.times { |i|
            puts "PLAYER #{i+1}"
            puts Prompt::MAKE_TOKEN_SELECTION
            selected_token = CommandLineIn.new.get_input.upcase
            assign_player_token(selected_token)
        }
        play_game
    end

    def play_game
        @players.each { |player| 
            puts "HELLO PLAYER #{player.token}"
            puts @presenter.display_board(@board.moves)
            user_coordinate = select_coordinate
            take_turn(@board.moves, user_coordinate, player.token)
        }
        play_game
    end
end



