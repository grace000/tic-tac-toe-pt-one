require 'input'
require 'input_validator'

describe Input do
  describe "#get_token" do
    it "should call get_input and validate_token until validate_token returns true" do
      # Arrange
      mockInputMethod = double
      allow(mockInputMethod).to receive(:get_input).and_return("3", "X")

      mockValidator = double
      allow(mockValidator).to receive(:validate_token).and_return(false, true)

      # Assert
      expect(mockInputMethod).to receive(:get_input).exactly(2).times
      expect(mockValidator).to receive(:validate_token).with("3").ordered
      expect(mockValidator).to receive(:validate_token).with("X").ordered

      # Act
      testInput = Input.new(mockInputMethod, mockValidator)
      testInput.get_token
    end
  end
end
