require "input"
require "stringio"

describe Input do
    before(:each) do
        @input = Input.new
    end

    describe "#prompt_input" do
        it "asks for input" do
            input_request = "Please make a selection"
            expect(@input.prompt_input).to eq(input_request)
        end
    end
    
    describe "#get_input" do 
        it "returns input from command line" do
            string_io = StringIO.new
            string_io.puts '1'
            string_io.rewind
            $stdin = string_io

            expect(@input.get_input).to eq('1')
        end
    end
end