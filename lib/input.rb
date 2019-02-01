require_relative 'command_line_input'
require_relative 'input_validator'
require_relative 'prompt'

class Input
  attr_reader :input_method, :validator

  def initialize(input_method = CommandLineInput.new, validator = InputValidator.new)
    @input_method = input_method
    @validator = validator
  end

  def get_token
    
    value = input_method.get_input
    
    if validator.validate_token(value)
        value
    else
        puts Prompt::RETRY_MAKE_TOKEN_SELECTION
        get_token
    end
  end
end
