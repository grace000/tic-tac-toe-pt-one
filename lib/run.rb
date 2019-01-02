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

def assign_token
    get_player_token == "X" ? "O": "X"
end

