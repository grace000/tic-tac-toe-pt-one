
class ComputerPlayer
    attr_accessor :token, :setting, :name
    
    def initialize(args)
        @token = args[:token]
        @name = "Computer"
        @setting = args[:setting]
    end

    def select_coordinate
        rand(1..9)
    end
end