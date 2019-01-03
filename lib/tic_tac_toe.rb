require_relative './command_line_in'
require_relative './prompt'
require_relative './board_presenter'

class TicTacToe
    def play
        puts Prompt::WELCOME
        CommandLineIn.new.get_input
        puts Prompt::MAKE_TOKEN_SELECTION
        selected_token = CommandLineIn.new.get_input
        puts "Thanks for selecting #{selected_token}. Let's start the game!" 
        puts BoardPresenter.new.display_board
    end
end



