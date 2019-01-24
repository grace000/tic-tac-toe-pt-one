require 'input'
require 'command_line_input'

describe Input do
    before(:each) do
        cli = CommandLineInput.new
        @input = Input.new(cli)
    end

    describe "#get_token" do
        context "given invalid token input" do
            it "expects a loop after invalid input" do
                allow_any_instance_of(CommandLineInput).to receive(:get_input).and_return("3")
                expect(@input).to receive(:get_token).exactly(1).times
                @input.get_token
            end

            it "exits loop after valid token input" do
                allow_any_instance_of(CommandLineInput).to receive(:get_input).and_return("X")
                result = @input.get_token
                expect(result).to eq("X")
            end
        end
    end
end
