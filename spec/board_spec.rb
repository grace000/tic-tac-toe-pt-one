require "board"

describe Board do
    describe "#spaces" do
        it "should provide spaces on board structure" do
            board = Board.new

            current_game_type = "Tic Tac Toe"
            expect(board.spaces(current_game_type)).to eq(Array.new(9, " "))
        end
    end

    describe "#board_full?" do 
        it "should return true if there are no remaining blank spaces" do
            board = Board.new

            current_game_type = "Tic Tac Toe"
            current_game_state = ["X", "O", "X", "X", "O", "X", "O", "O", "X"]

            expect(board.board_full?(current_game_type, current_game_state)).to eq(true)
        end

        it "should return false if there are remaining blank spaces" do
            board = Board.new

            current_game_type = "Tic Tac Toe"
            current_game_state = ["X", "O", "X", "X", "O", "X", "O", " ", "X"]

            expect(board.board_full?(current_game_type, current_game_state)).to eq(false)
        end
    end

    describe "#empty_spaces_locations" do
        it "should return array with one coordinate not currently marked by a player" do
            board = Board.new

            current_game_type = "Tic Tac Toe"
            current_game_state = ["X", "O", "X", "X", "O", "X", "O", " ", "X"]
            empty_spaces = board.empty_spaces_locations(current_game_type, current_game_state)
            
            expect(empty_spaces).to eq([7])
        end

        it "should return array with multiple coordinates not currenlty marked by a player" do
            board = Board.new

            current_game_type = "Tic Tac Toe"
            current_game_state = ["X", "O", "X", " ", "O", " ", "O", " ", "X"]
            empty_spaces = board.empty_spaces_locations(current_game_type, current_game_state)
            
            expect(empty_spaces).to eq([3,5,7])
        end
    end

    describe "#position_available?" do
        it "should return true if position on board is not marked by a player" do
            board = Board.new

            current_game_type = "Tic Tac Toe"
            current_game_state = ["X", "O", "X", " ", "O", " ", "O", " ", "X"]
            requested_space = 3
            space_available = board.position_available?(current_game_type, current_game_state, requested_space)

            expect(space_available).to eq(true)
        end
        
        it "should return false if position on board is marked by a player" do
            board = Board.new

            current_game_type = "Tic Tac Toe"
            current_game_state = ["X", "O", "X", " ", "O", " ", "O", " ", "X"]
            requested_space = 2
            space_available = board.position_available?(current_game_type, current_game_state, requested_space)

            expect(space_available).to eq(false)
        end
    end

    describe "#fill space" do
        it "should place a marker at a an empty space" do
            board = Board.new
            
            current_game_type = "Tic Tac Toe"
            current_game_state = ["X", "O", " ", " ", "O", " ", "O", " ", "X"]
            requested_move = 2
            player_marker = "X"
            updated_game_state = ["X", "O", "X", " ", "O", " ", "O", " ", "X"]
            
            player_move = board.fill_space(current_game_type, current_game_state, requested_move, player_marker)
            expect(player_move).to eq(updated_game_state)
        end
    end

    describe "#player_positions" do
        it "should provide arrays that represent players' current coordinates on board" do
            board = Board.new

            current_game_type = "Tic Tac Toe"
            current_game_state = ["X", "O", " ", " ", "O", " ", "O", " ", "X"]
            player_x = ["X", [0, 8]]
            player_o = ["O", [1, 4, 6]]
            
            player_spaces = [
                player_x, 
                player_o 
            ]

            positions = board.player_positions(current_game_type, current_game_state)
            expect(positions).to eq(player_spaces)
        end
    end
end



