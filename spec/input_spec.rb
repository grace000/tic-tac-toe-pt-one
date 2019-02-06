require 'input'
require 'input_validator'

class MockInputMethod 
  def initialize(input)
    @input = input
  end

  def get_input
    @input
  end
end

class MockValidator
  def validate_token(value)
    !!(value =~ %r{\A[a-zA-Z]{1}\z})
  end

  def valid_coordinate?(requested_move)
    requested_move.to_s.match?(/[1-9]/) 
  end
end

describe Input do
  describe "#get_token" do
    it "returns valid token after validation" do
      test_input = Input.new(MockInputMethod.new("X"), MockValidator.new)
      
      expect(test_input.get_token).to eq("X")
    end
  end

  describe "#get_coordinate" do
    it "returns valid coordinate after validation" do
      test_input = Input.new(MockInputMethod.new(7), MockValidator.new)
      
      expect(test_input.get_coordinate).to eq(7)
    end
  end
end
