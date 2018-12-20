
class Board
    def display
        "    1    |  2   |   3   #{horizontal_bar}    4    |  5   |   6   #{horizontal_bar}    7    |  8   |   9  \n"
    end
    
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

    private

    def horizontal_bar
        "\n--------------------------\n"
    end

end
