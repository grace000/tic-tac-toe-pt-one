class Prompt
    def welcome
        puts "\nWelcome to Tic Tac Toe, the game that never gets dull! 
        Let's start by selecting two players..."
    end

    def player_selection(player_number)
        puts "For player #{player_number}, type the letter that corresponds to the player you want:"
        puts " Human Player (H)"
        puts " Easy Computer (E)"
        puts " Difficult Computer (D)"
    end

    def confirm_player_info(name, token)
        puts "#{name}, thanks for selecting #{token}."
    end
 
    def retry_make_opponent_selection
        puts "Please try again. Just type H for human player, E for easy computer
        or D for difficult computer."
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