class TicTacToeRules
    def winner?(moves)
        return false if moves.length <= 2 
        match_box = []

        winning_combos.map do |combo|
            match_box = []
            moves.map do |move|
                if combo.include?(move)
                    match_box << move
                end
            end
            return true if match_box.length == 3
        end
        false
    end

    def draw?(moves)
        return false unless moves.length == 4
        match_box = []

        winning_combos.map do |combo|
            match_box = []
            moves.map do |move|
                if combo.include?(move)
                    match_box << move
                end
            end
            return false if match_box.length == 3
        end
        true
    end

    private 

        def winning_combos
            [
                [0,1,2],
                [3,4,5],
                [6,7,8],
                [0,3,6],
                [1,4,7],
                [2,5,8],
                [0,4,8],
                [2,4,6]
            ]
        end
end

