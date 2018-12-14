require "tic_tac_toe_rules"

describe TicTacToeRules do
    describe "#winner?" do
        it "should return true if a set of markings STRAIGHT--match a winning combo" do
            result = TicTacToeRules.new()

            moves = [0,1,2]
            call = result.winner?(moves)
            expect(call).to eq(true)
        end

        it "should return true if a different set of markings STRAIGHT--match a winning combo" do
            result = TicTacToeRules.new()
            
            expect(result.winner?([3,4,5])).to eq(true)
            expect(result.winner?([6,7,8])).to eq(true)
            expect(result.winner?([0,3,6])).to eq(true)
            expect(result.winner?([1,4,7])).to eq(true)
            expect(result.winner?([2,5,8])).to eq(true)
        end

        it "should return true if a set of markings BOX-match a winning combo" do
            result = TicTacToeRules.new()

            moves = [7,6,8]
            call = result.winner?(moves)
            expect(call).to eq(true)
        end

        it "should return true if a different set of markings BOX-match a winning combo" do
            result = TicTacToeRules.new()

            expect(result.winner?([3,5,4])).to eq(true)
            expect(result.winner?([8,6,7])).to eq(true)
            expect(result.winner?([3,6,0])).to eq(true)
            expect(result.winner?([4,7,1])).to eq(true)
            expect(result.winner?([2,8,5])).to eq(true)
        end

        it "should return true if a set of markings CONTAIN a winning combo" do
            result = TicTacToeRules.new()

            expect(result.winner?([7,6,3,0])).to eq(true)
            expect(result.winner?([1,4,7,2])).to eq(true)
            expect(result.winner?([0,6,3,4])).to eq(true)
            expect(result.winner?([8,4,3,0])).to eq(true)
        end

        it "should return false if a set of markings does not contain at least 3 marks" do
            result = TicTacToeRules.new()

            expect(result.winner?([0,4])).to eq(false)
            expect(result.winner?([0])).to eq(false)
        end
    end 
    
    describe "#draw?" do
        it "should return false if a set of markings does not contain at least 4 marks" do
            result = TicTacToeRules.new()

            expect(result.draw?([0])).to eq(false)
            expect(result.draw?([0,4])).to eq(false)
            expect(result.draw?([0,4,3])).to eq(false)
        end

        it "should return false if a set of markings contain a winning combo" do
            result = TicTacToeRules.new()

            expect(result.draw?([0,2,4,6])).to eq(false)
            expect(result.draw?([7,6,3,0])).to eq(false)
        end

        it "should return true if a set of markings does not contain a winning combo" do
            result = TicTacToeRules.new()

            expect(result.draw?([0,5,4,6])).to eq(true)
            expect(result.draw?([1,5,8,6])).to eq(true)
        end
    end 
    
end