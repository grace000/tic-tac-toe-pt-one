require_relative './prompt'
require_relative './input'

class HumanPlayer 
    attr_accessor :token, :name
    
    def initialize(args)
        @token = args[:token]
        @name = args[:name]
        @input = Input.new
        @prompt = Prompt.new
    end

    def select_coordinate(board, players = nil)
        @prompt.make_coordinate_selection
        player_input = @input.get_coordinate
        if board.space_available?(player_input)
            player_input
        else
            select_coordinate(board)
        end
    end
end