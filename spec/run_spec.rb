require 'tic_tac_toe'

describe TicTacToe do
    before(:each) do
        @tic_tac_toe = TicTacToe.new
    end

    describe "#assign_token" do
        it "assigns the second player with a token O when X is taken" do
            test_token = 'X'

            expect(@tic_tac_toe.assign_token(test_token)).to eq('O')
        end

        it "assigns the second player with a token X when O is taken" do
            test_token = 'O'

            expect(@tic_tac_toe.assign_token(test_token)).to eq('X')
        end
    end
end 