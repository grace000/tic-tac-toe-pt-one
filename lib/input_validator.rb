class InputValidator
    def valid_character?(move)
        regex = /\D/ 
        if move =~ regex || move <= 0
            return false
        end
        true
    end

    def valid_move?(move)
        false
    end
end
