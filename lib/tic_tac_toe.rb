require_relative './command_line_in'
require_relative './prompt'
require_relative './board_presenter'
require_relative './board'
require_relative './input_validator'
require_relative './player'

class TicTacToe
    attr_accessor :board 
    attr_reader :human_player, :computer_player
    def initialize
        @board = Board.new
        @presenter = BoardPresenter.new
    end

    def human_player=(input)
        @human_player = Player.new(input)
    end

    def computer_player=(input)
        @computer_player = Player.new(input)
    end


    def get_human_player_token
        token = CommandLineIn.new.get_input.upcase
        self.human_player = token
        input_validator = InputValidator.new
        if input_validator.valid_token?(human_player.token)
            puts "Thanks for selecting #{human_player.token}."
        else
            puts Prompt::RETRY_MAKE_TOKEN_SELECTION
            get_human_player_token
        end
    end

    def get_computer_player_token
        token = "X"
        while 
            token == human_player.token
            token = ("A".."Z").to_a.sample
        end
        self.computer_player = token
        puts "The computer will play with #{token}. Let's start the game!"
    end

    def human_take_turn(board, position, token)
        input_validator = InputValidator.new
        if input_validator.valid_coordinate?(@board.moves, position)
            @board.move(token, position)
        else
            user_coordinate = select_coordinate
            human_take_turn(@board.moves, user_coordinate, human_player.token)
        end
    end

    def select_coordinate
        puts Prompt::MAKE_COORDINATE_SELECTION
        CommandLineIn.new.get_input.to_i
    end

    def start_game_engine
        puts Prompt::WELCOME
        puts Prompt::MAKE_TOKEN_SELECTION
        get_human_player_token
        get_computer_player_token
        play_game
    end

    def play_game
        puts @presenter.display_board(@board.moves)
        user_coordinate = select_coordinate
        human_take_turn(@board.moves, user_coordinate,human_player.token)
        play_game
    end
end



