class Player 
    attr_accessor :token, :name
    def initialize(args)
        @token = args[:token]
        @name = args[:name]
    end
end