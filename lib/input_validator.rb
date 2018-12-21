require_relative "board"

class InputValidator
    def initialize
        @invalid_moves = []
    end

    def valid_character?(move)
        regex = /\D/ 
        if move =~ regex || move <= 0
            return false
        end
        true
    end

    def get_invalid_moves(board)
        board.moves.each do |i|
            @invalid_moves << i 
        end
    end

    def valid_move?(move)
        !@invalid_moves.include?(move)
    end
end
