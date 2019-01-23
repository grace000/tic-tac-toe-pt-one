require 'input'
require 'command_line_in'
require "stringio"

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
    end

end
