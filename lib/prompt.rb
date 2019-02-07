class Prompt
    def welcome
        puts "\nWelcome to Tic Tac Toe, the game that never gets dull!"
    end

    def make_opponent_selection
        puts "\nWould you like to play with the computer? Type Y for yes or N for no."
    end
 
    def retry_make_opponent_selection
        puts "Please try again. Just type Y or N. Y for yes. N for no."
    end

    def human_players
        puts "Cool, a game with two human players. Let's select some tokens." 
    end

    def computer_token(token)
        puts "\nHuman vs Computer Game selected. The computer will play with #{token}!"
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