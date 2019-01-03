require_relative './input'
require_relative './prompt'
require_relative './board_presenter'

class TicTacToe
    def assign_token(taken_token)
        taken_token == 'X' ? "O" : "X"
    end

    def run
        puts Prompt::WELCOME
        Input.new.get_input
        puts Prompt::MAKE_TOKEN_SELECTION
        selected_token = Input.new.get_input
        puts "Thanks for selecting #{selected_token}. Player 2 will use #{assign_token(selected_token)}" 
        puts BoardPresenter.new.display_board
    end
end
