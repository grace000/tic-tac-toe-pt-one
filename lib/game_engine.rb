
class GameEngine
    attr_reader :token
    def initialize(token)
        @token = token
    end

    def run_game
    end

    def display_token
        puts "You have selected #{token}. Let's start the game!"
    end
end

