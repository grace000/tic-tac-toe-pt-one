class InputValidator
    def valid_coordinate?(move)
        regex = /\D/ 
        if move =~ regex || move <= 0
            return false
        end
        true
    end

    def valid_move?(board_state, move)
        move -= 1
        board_state[move].nil?
    end

    def valid_token?(token)
        token == "X" || token == "O"
    end
end
