require_relative './input_validator'

class Input
    attr_accessor :input_type
    def initialize(input_type)
        @input_type = input_type
    end

    def get_token
        input = input_type.get_input 
        validator = InputValidator.new
        loop do
            break if validator.valid_token?(input)
            puts "Try again. Please enter valid token."
            input = input_type.get_input 
        end
        input.upcase
    end
end

