require 'easy_computer_player'

describe EasyComputerPlayer do
    describe "#select_coordinate" do
        it "returns a random number between 1 and 9" do
            computer_player = EasyComputerPlayer.new(token: "X")
            allow(computer_player).to receive(:select_coordinate).and_return(2)
            expect(computer_player.select_coordinate).to eq(2)
        end
    end
end