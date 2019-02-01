
class Board
    attr_reader :moves

    def initialize
        @moves = []
    end
    
    def empty?
        moves.length == 0
    end

    def full?
        moves.length == 9 && !moves.include?(nil)
    end

    def move(token, position)
        position -= 1
        @moves[position] = token
    end
end