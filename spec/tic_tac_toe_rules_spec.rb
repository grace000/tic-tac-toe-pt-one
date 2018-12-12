require "tic_tac_toe_rules"

describe TicTacToeRules do
    describe "#winner?" do
        it "should return true if a set of markings STRAIGHT--match a winning combo" do
            tic_tac_toe_ruling = TicTacToeRules.new()

            player_stats = [0,1,2]
            player_win = tic_tac_toe_ruling.winner?(player_stats)
            expect(player_win).to eq(true)
        end

        it "should return true if a different set of markings STRAIGHT--match a winning combo" do
            tic_tac_toe_ruling = TicTacToeRules.new()

            player_stats = [3,4,5]
            player_win = tic_tac_toe_ruling.winner?(player_stats)
            expect(player_win).to eq(true)
        end

        it "should return true if a different set of markings STRAIGHT-match a winning combo" do
            tic_tac_toe_ruling = TicTacToeRules.new()

            player_stats = [6,7,8]
            player_win = tic_tac_toe_ruling.winner?(player_stats)
            expect(player_win).to eq(true)
        end

        it "should return true if a set of markings BOX-match a winning combo" do
            tic_tac_toe_ruling = TicTacToeRules.new()

            player_stats = [7,6,8]
            player_win = tic_tac_toe_ruling.winner?(player_stats)
            expect(player_win).to eq(true)
        end

        it "should return true if a set of markings CONTAIN a winning combo" do
            tic_tac_toe_ruling = TicTacToeRules.new()

            player_stats = [7,6,3,0]
            player_win = tic_tac_toe_ruling.winner?(player_stats)
            expect(player_win).to eq(true)
        end


    end  
    
end