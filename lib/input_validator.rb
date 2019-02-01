class InputValidator
    def valid_coordinate?(board_state, requested_move)
        requested_move.to_s.match?(/[1-9]/) && board_state[requested_move-1].nil?
    end

    def validate_token(value)
        !!(value =~ %r{\A[a-zA-Z]{1}\z})
    end
end