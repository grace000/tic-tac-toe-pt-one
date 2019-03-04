require 'hard_computer_player'
require 'board'
require 'human_player'
require 'hard_computer_player'

describe HardComputerPlayer do
    before(:each) do
        @hard_computer_player = HardComputerPlayer.new(token:"X")
        @board = Board.new
    end

    def setup_players
        human_player = HumanPlayer.new(token: "O", name: "Tim")
        computer_player = HardComputerPlayer.new(token: "X", board: @board)

        @players = [human_player, computer_player]
    end

    describe "#select_coordinate" do
        it "computer player does not change board while calculating a move" do
            self.setup_players
            
            @board.update("X", 1)

            computer_coordinate = @hard_computer_player.select_coordinate(@board, @players)
            expect(@board.moves).to eq(["X", 2, 3, 4, 5, 6, 7, 8, 9])
        end
    
        it "provides a coordinate to tie the game given one last update on the board " do
            self.setup_players

            @board.update("X", 1)
            @board.update("O", 2)
            @board.update("X", 3)
            @board.update("O", 4)
            @board.update("O", 5)
            @board.update("X", 6)
            @board.update("X", 7)
            @board.update("O", 9)

            computer_coordinate = @hard_computer_player.select_coordinate(@board, @players)
            expect(computer_coordinate).to eq(8)
        end

        it "ensures that computer selects coordinate to win diagonally at first opportunity" do
            self.setup_players
            
            @board.update("O", 2)
            @board.update("X", 1)
            @board.update("O", 7)
            @board.update("X", 5)
            @board.update("O", 8)

            computer_coordinate = @hard_computer_player.select_coordinate(@board, @players)
            expect(computer_coordinate).to eq(9)
        end

        it "provides a coordinate to win the game given final two moves" do
            self.setup_players
            
            @board.update("O", 2)
            @board.update("X", 7)
            @board.update("O", 4)
            @board.update("X", 8)
            @board.update("O", 3)
            @board.update("X", 1)
            @board.update("O", 5)

            computer_coordinate = @hard_computer_player.select_coordinate(@board, @players)
            expect(computer_coordinate).to eq(9)
        end

        it "provides a coordinate to win the game vertically at the first opportunity" do
            self.setup_players
            
            @board.update("O", 5)
            @board.update("X", 1)
            @board.update("O", 2)
            @board.update("X", 8)
            @board.update("O", 3)
            @board.update("X", 7)
            @board.update("O", 6)

            computer_coordinate = @hard_computer_player.select_coordinate(@board, @players)
            expect(computer_coordinate).to eq(4)
        end

        it "provides a coordinate to win the game horizontally at the first opportunity" do
            self.setup_players
            
            @board.update("O", 5)
            @board.update("X", 1)
            @board.update("O", 8)
            @board.update("X", 2)
            @board.update("O", 7)

            computer_coordinate = @hard_computer_player.select_coordinate(@board, @players)
            expect(computer_coordinate).to eq(3)
        end
    end
end