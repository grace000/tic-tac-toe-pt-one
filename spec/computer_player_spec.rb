require 'computer_player'

describe ComputerPlayer do
    describe "#select_coordinate" do
        it "returns a random number between 1 and 9" do
            computer_player = ComputerPlayer.new(token: "X", setting: "Easy")
            allow(computer_player).to receive(:select_coordinate).and_return(2)
            expect(computer_player.select_coordinate).to eq(2)
        end
    end
end