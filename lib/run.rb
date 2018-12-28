require_relative './input'
require_relative './prompt'

def prompt_players
    puts Prompt::WELCOME
end

def get_players
    input = Input.new.get_input
end

def prompt_token_selection
    puts Prompt::MAKE_TOKEN_SELECTION
end

def get_player_token
    input = Input.new.get_input
end
