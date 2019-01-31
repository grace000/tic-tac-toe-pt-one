
class Board
    attr_reader :moves

    def initialize
        @moves = Array.new(9) {|i| i + 1} 
    end

    def full?
        !moves.any?(1..9)
    end

    def move(token, position)
        position -= 1
        @moves[position] = token
    end
end