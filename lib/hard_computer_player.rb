class HardComputerPlayer
    attr_accessor :token, :name
    
    def initialize(args)
        @token = args[:token]
        @name = "Computer"
    end

    def select_coordinate
        rand(1..9)
    end
end