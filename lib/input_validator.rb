class InputValidator
    def valid_coordinate?(requested_move)
        requested_move_is_integer?(requested_move)
    end

    def validate_token(token)
        !token.nil? && token.match?(/^[a-zA-Z]$/) 
    end

    def validate_player_selection(opponent_input)
        !opponent_input.nil? && opponent_input.match?(/^[edhEDH]$/) 
    end

    private

    def requested_move_is_integer?(requested_move)
        requested_move.to_s.match?(/[1-9]/) 
    end
end