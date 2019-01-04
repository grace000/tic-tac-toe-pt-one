
class Board
    attr_reader :moves

    def initialize
        @moves = []
    end
    
    def empty?
        @moves.length == 0
    end

    def full?
        @moves.length == 9
    end

    def move(token, position)
        @moves.insert(position-1, token)
    end
end