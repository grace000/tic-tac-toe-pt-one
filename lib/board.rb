
class Board
    def spaces(current_game_type)
        if current_game_type == "Tic Tac Toe"
            Array.new(9, " ")
        end
    end
    
    def board_full?(current_game_type, current_game_state)
        if current_game_type == "Tic Tac Toe"
            if current_game_state.include? (" ")
                return false
            end
            true
        end
    end

    def empty_spaces_locations(current_game_type, current_game_state)
        locations = []
        if current_game_type == "Tic Tac Toe"
            current_game_state.map.with_index do |value, index|
               if value == " "
                locations << index
               end
            end
        end
        locations
    end

    def position_available?(current_game_type, current_game_state, requested_space)
        if current_game_type == "Tic Tac Toe"
            return true if current_game_state[requested_space] == " "
        end
        false
    end

    def fill_space(current_game_type, current_game_state, requested_move, player_marker)
        if current_game_type == "Tic Tac Toe"
            if current_game_state[requested_move] == " "
               current_game_state[requested_move] = player_marker
               current_game_state
            end
        end
    end

    def player_positions(current_game_type, current_game_state)
        player_spaces = []
        
        if current_game_type == "Tic Tac Toe"
            player_x = ["X",[]]
            player_o = ["O",[]]

            player_spaces = [player_x, player_o]
            current_game_state.map.with_index do |value, index|
                if value == "X"
                    player_spaces[0][1] << index
                elsif value == "O"
                    player_spaces[1][1] << index
                end
            end
        end
        player_spaces
    end

end
