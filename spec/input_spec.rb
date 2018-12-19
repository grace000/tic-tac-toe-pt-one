require "input"
require "stringio"

describe Input do
    before(:each) do
        @input = Input.new
    end
    
    describe "#get_input" do 
        after do
            $stdin = STDIN
        end

        it "returns input from command line" do
            string_io = StringIO.new
            string_io.puts '1'
            string_io.rewind
            $stdin = string_io

            expect(@input.get_input).to eq('1')
        end

        it "returns a different input from command line" do
            string_io = StringIO.new
            string_io.puts '2'
            string_io.rewind
            $stdin = string_io

            expect(@input.get_input).to eq('2')
        end
    end
end