
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
        position =- 1
        @moves.insert(position, token)
    end
end