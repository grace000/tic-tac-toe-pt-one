require "input_validator"

describe InputValidator do
    describe "#valid_character?" do
        it "should return true for integers 1 through 9" do
            input_v = InputValidator.new

            expect(input_v.valid_character?(2)).to eq(true)
            expect(input_v.valid_character?(5)).to eq(true)
            expect(input_v.valid_character?(0)).to eq(false)
            expect(input_v.valid_character?("k")).to eq(false)
            expect(input_v.valid_character?("+")).to eq(false)
            expect(input_v.valid_character?("/")).to eq(false)
        end     
    end
end