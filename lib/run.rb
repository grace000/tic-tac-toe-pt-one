require_relative './input'
require_relative './prompt'
require_relative './board_presenter'

def prompt_players
    puts Prompt::WELCOME
end

def get_players
    Input.new.get_input
end

def prompt_token_selection
    puts Prompt::MAKE_TOKEN_SELECTION
end

def get_player_token
    Input.new.get_input
end

def display_board
    BoardPresenter.new.display_board
end

def assign_token(taken_token)
    taken_token == "X" ? "O" : "X"
end

def run
    prompt_players
    get_players
    prompt_token_selection
    selected_token = get_player_token
    puts "Thanks for selecting #{selected_token}. Player 2 will use #{assign_token(selected_token)}" 
    puts display_board
end

run