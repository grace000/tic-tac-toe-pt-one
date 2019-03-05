
class EasyComputerPlayer
    attr_accessor :token, :name
    
    def initialize(args)
        @token = args[:token]
        @name = "Easy Computer"
    end

    def select_coordinate(board, players = nil)
        random_coordinate = rand(1..9)
        if board.space_available?(random_coordinate)
            random_coordinate
        else
            select_coordinate(board)
        end
    end
end