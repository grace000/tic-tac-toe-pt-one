require 'input'
require 'command_line_in'
require 'stringio'

describe Input do

    describe "#get_token" do
        after do
            $stdin = STDIN
        end

        it "returns a valid player token" do
            cli = CommandLineIn.new 
            input = Input.new(cli)
            string_io = StringIO.new
            string_io.puts 'k'
            string_io.rewind
            $stdin = string_io

            expect(input.get_token).to eq("K")
        end

        context "an invalid token has been provided" do
            before do
                input = "!"
                validator = InputValidator.new
                allow(get_token).to receive(validator.valid_token?(input)).and_return(false)
            end
        end

        it "continues to loop for valid input" do
            expect(get_token).to receive(validator.valid_token?(input)).exactly(:once)
            get_token
        end
    end

end
