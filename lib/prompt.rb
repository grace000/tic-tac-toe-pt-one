class Prompt
    def welcome
        puts "Welcome to Tic Tac Toe, the game that never gets dull!"
    end

    def game_type
        puts "Would you like to play with the computer?"
    end

    def rretry_make_game_type_selection
        puts "Please try again. Just type Y or N. Y is yes. N is no"
    end

    def human_players
        puts "Cool, let's play with two human players."
    end

    def enter_player_name
        puts "What's your first name?"
    end

    def make_token_selection
        puts "    Please type a single character that you would like to 
        use throughout the game as your token. 
        Must be an alphabetical character (A-Z)..."
    end 
    
    def retry_make_token_selection
        puts "Please try again. Token must be an alphabetical character (A-Z)..."
    end

    def make_coordinate_selection 
        puts "Please select an available spot on the board (1-9)"
    end

    def winner_message(player)
        puts "#{player} is the WINNER! WOOOPIIEEEE"
    end

    def draw_message
        puts "Draw Game!"
    end
end