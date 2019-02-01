class InputValidator
    def valid_coordinate?(board_state, requested_move)
        requested_move_is_integer?(requested_move) &&
        requested_move_available?(board_state, requested_move)
    end

    def validate_token(token)
        !token.nil? && token.match?(/^[a-zA-Z]$/) 
    end

    def validate_game_selection(game_type)
        !game_type.nil? && game_type.match?(/^[ynYN]$/) 
    end

    private

    def requested_move_is_integer?(requested_move)
        requested_move.to_s.match?(/[1-9]/) 
    end

    def requested_move_available?(board_state, requested_move)
        !board_state[requested_move-1].is_a?(String)
    end
end