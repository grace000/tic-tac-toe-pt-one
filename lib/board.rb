
class Board
    
    def initialize
        @moves = []
    end
    
    def empty?
        @moves.length == 0
    end

    def full?
        @moves.length == 9
    end

    def move(position)
        @moves << position
    end
end
