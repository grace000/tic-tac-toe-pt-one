class Prompt
    WELCOME = "Welcome to Tic Tac Toe, the game that never gets dull!"

    MAKE_TOKEN_SELECTION = 
    "    Please type a single character that you would like to 
    use throughout the game as your token. 
    Must be an alphabetical character (A-Z)..."

    RETRY_MAKE_TOKEN_SELECTION = "Please try again. Token must be an alphabetical character (A-Z)..."

    MAKE_COORDINATE_SELECTION = "Please select an available spot on the board (1-9)"

    def winner_message(player)
        puts "#{player} is the WINNER! WOOOPIIEEEE"
    end

    def draw_message
        puts "Draw Game!"
    end
end