require_relative './prompt'
require_relative './input'

class HumanPlayer 
    attr_accessor :token, :name
    
    def initialize(args, prompt = Prompt.new)
        @token = args[:token]
        @name = args[:name]
        @input = Input.new
        @prompt = prompt
    end

    def select_coordinate
        @prompt.make_coordinate_selection
        @input.get_coordinate
    end
end