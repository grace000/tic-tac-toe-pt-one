
class Board
    attr_reader :moves

    def initialize
        @moves = Array.new(9)
    end
    
    def empty?
        moves.all? { |move| move.nil? }
    end

    def full?
        moves.length == 9 && !moves.include?(nil)
    end

    def move(token, position)
        position -= 1
        @moves[position] = token
    end
end