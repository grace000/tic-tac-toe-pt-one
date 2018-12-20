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

    def get_invalid_moves
        @invalid_moves << moves
    end

    def valid_move?(move, board)
        return false if board.include?(move)
    end
end
