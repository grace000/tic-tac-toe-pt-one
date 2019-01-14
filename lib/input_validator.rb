class InputValidator
    def valid_coordinate?(move)
        regex = /\D/ 
        if move =~ regex || move <= 0
            return false
        end
        true
    end

    def valid_token?(token)
        token.match?(/[a-zA-Z]/) && token.length == 1
    end
end
