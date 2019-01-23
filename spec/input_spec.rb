require 'input'
require 'command_line_in'
require 'stringio'

describe Input do
    before(:each) do
        cli = CommandLineIn.new
        @input = Input.new(cli)
    end

    describe "#get_token" do
        it "requests that user select token again after invalid input" do
            allow(@input).to receive(:gets).and_return("!")
            allow(@input).to receive(:loop).and_yield

            expect { @input.get_token }
                .to output("Try again. Please enter valid token.\n")
                .to_stdout
        end
    end
end
