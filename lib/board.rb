
class Board
    attr_reader :moves

    def initialize
        @moves = (1..9).to_a
    end

    def full?
        !@moves.any?(1..9)
    end

    def update(token, position)
        position -= 1
        @moves[position] = token
    end

    def space_available?(position)
        !@moves[position-1].is_a?(String)
    end

    def empty_spaces
        @moves.select { |move| move if move.is_a?(Integer) }
    end
end