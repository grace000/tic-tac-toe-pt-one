class GameResults
    def winner?(moves)
        return false if moves.length <= 2 
        winning_combos.any? { |i, j, k|
            moves[i] == moves[j] && moves[i] == moves[k]
        }
    end

    def draw?(board)
        board.full?
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
            @winning_rows = [
                [0,1,2],
                [3,4,5],
                [6,7,8],
            ]
        end
        
        def winning_cols
           @winning_cols =  [
                [0,3,6],
                [1,4,7],
                [2,5,8],
            ]
        end

        def winning_diags
            @winning_diags = [
                [0,4,8],
                [2,4,6]
            ]
        end
end
