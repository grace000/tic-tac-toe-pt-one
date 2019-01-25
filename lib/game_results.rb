class GameResults
    def winner?(board)
        if board.moves.length >= 5
            has_winning_combos?(board)
        else 
            false
        end
    end

    def has_winning_combos?(board)
        winning_combos.any? { |i, j, k|
            board.moves[i] == board.moves[j] && board.moves[i] == board.moves[k]
        }
    end

    def draw?(board)
        !has_winning_combos?(board)
    end

    def winning_combos
        [ 
            winning_rows,
            winning_cols,
            winning_diags
        ].flatten(1)
    end

    private 

        def winning_rows
            [
                [0,1,2],
                [3,4,5],
                [6,7,8],
            ]
        end
        
        def winning_cols
            [
                [0,3,6],
                [1,4,7],
                [2,5,8],
            ]
        end

        def winning_diags
            [
                [0,4,8],
                [2,4,6]
            ]
        end
end
