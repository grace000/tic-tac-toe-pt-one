require 'run'

describe "#assign_token" do
    it "assigns the second player with a token O when X is taken" do
        test_token = 'X'

        expect(assign_token(test_token)).to eq('O')
    end

    it "assigns the second player with a token X when O is taken" do
        test_token = 'O'

        expect(assign_token(test_token)).to eq('X')
    end
end