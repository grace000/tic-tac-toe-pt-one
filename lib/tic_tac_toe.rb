require_relative './command_line_in'
require_relative './prompt'
require_relative './board_presenter'

class TicTacToe
    def assign_token(taken_token)
        taken_token == 'X' ? "O" : "X"
    end

    def play
        puts Prompt::WELCOME
        CommandLineIn.new.get_input
        puts Prompt::MAKE_TOKEN_SELECTION
        selected_token = CommandLineIn.new.get_input
        puts "Thanks for selecting #{selected_token}. Player 2 will use #{assign_token(selected_token)}" 
        puts BoardPresenter.new.display_board
    end
end



