require_relative 'command_line_input'
require_relative 'input_validator'
require_relative 'prompt'

class Input
  attr_reader :input_method, :validator

  def initialize(input_method = CommandLineInput.new, validator = InputValidator.new)
    @input_method = input_method
    @validator = validator
    @prompt = Prompt.new
  end

  def get_token
    value = input_method.get_input
    
    if validator.validate_token(value)
        value.upcase
    else
        @prompt.retry_make_token_selection
        get_token
    end
  end

  def get_player_name
    player_name = input_method.get_input
  end

  def get_game_type
  game_type = input_method.get_input

    if validator.validate_game_selection(game_type)
      game_type.upcase
    else
      @prompt.retry_make_game_type_selection
      get_game_type
    end
  end
end
