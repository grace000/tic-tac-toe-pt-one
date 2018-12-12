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

            player = tic_tac_toe_ruling
            expect(player.winner?([3,4,5])).to eq(true)
            expect(player.winner?([6,7,8])).to eq(true)
            expect(player.winner?([0,3,6])).to eq(true)
            expect(player.winner?([1,4,7])).to eq(true)
            expect(player.winner?([2,5,8])).to eq(true)
        end

        it "should return true if a set of markings BOX-match a winning combo" do
            tic_tac_toe_ruling = TicTacToeRules.new()

            player_stats = [7,6,8]
            player_win = tic_tac_toe_ruling.winner?(player_stats)
            expect(player_win).to eq(true)
        end

        it "should return true if a different set of markings BOX-match a winning combo" do
            tic_tac_toe_ruling = TicTacToeRules.new()

            player = tic_tac_toe_ruling
            expect(player.winner?([3,5,4])).to eq(true)
            expect(player.winner?([8,6,7])).to eq(true)
            expect(player.winner?([3,6,0])).to eq(true)
            expect(player.winner?([4,7,1])).to eq(true)
            expect(player.winner?([2,8,5])).to eq(true)
        end

        it "should return true if a set of markings CONTAIN a winning combo" do
            tic_tac_toe_ruling = TicTacToeRules.new()

            player = tic_tac_toe_ruling
            expect(player.winner?([7,6,3,0])).to eq(true)
            expect(player.winner?([1,4,7,2])).to eq(true)
            expect(player.winner?([0,6,3,4])).to eq(true)
            expect(player.winner?([8,4,3,0])).to eq(true)
        end


    end  
    
end