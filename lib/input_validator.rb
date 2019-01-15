class InputValidator
    def valid_coordinate?(board_state, requested_move)
        requested_move.to_s.match?(/[1-9]/) && board_state[requested_move-1].nil?
    end

    def valid_token?(token)
        !token.nil? && token.match?(/[a-zA-Z]/) && token.length == 1
    end
end