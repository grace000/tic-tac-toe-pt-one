require "tic_tac_toe_rules"

describe TicTacToeRules do
    describe "#winner?" do
        it "should return true if a player's set of markings straight-match a winning combo" do
            tic_tac_toe_ruling = TicTacToeRules.new()

            player_stats = [0,1,2]
            player_win = tic_tac_toe_ruling.winner?(player_stats)
            expect(player_win).to eq(true)
        end

        it "should return true if a different player's set of markings straight-match a winning combo" do
            tic_tac_toe_ruling = TicTacToeRules.new()

            player_stats = [3,4,5]
            player_win = tic_tac_toe_ruling.winner?(player_stats)
            expect(player_win).to eq(true)
        end

        it "should return true if a different player's set of markings straight-match a winning combo" do
            tic_tac_toe_ruling = TicTacToeRules.new()

            player_stats = [6,7,8]
            player_win = tic_tac_toe_ruling.winner?(player_stats)
            expect(player_win).to eq(true)
        end

        it "should return true if a different player's set of markings box-match a winning combo" do
            tic_tac_toe_ruling = TicTacToeRules.new()

            player_stats = [7,6,8]
            player_win = tic_tac_toe_ruling.winner?(player_stats)
            expect(player_win).to eq(true)
        end

    end  
    
end