
class Board
    attr_reader :moves

    def initialize
        @moves = (1..9).to_a
    end

    def full?
        !moves.any?(1..9)
    end

    def move(token, position)
        position -= 1
        @moves[position] = token
    end
end