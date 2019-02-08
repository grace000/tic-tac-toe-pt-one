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

  def get_players
  opponent_input = input_method.get_input

    if validator.validate_player_selection(opponent_input)
      opponent_input.upcase
    else
      @prompt.retry_make_opponent_selection
      get_players
    end
  end

  def get_coordinate
    requested_move = input_method.get_input.to_i

    if validator.valid_coordinate?(requested_move)
        requested_move
    else
        @prompt.make_coordinate_selection
        get_coordinate
    end
  end
end
