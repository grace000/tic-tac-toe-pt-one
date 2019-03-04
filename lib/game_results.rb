class GameResults
    def winner?(board)
        has_winning_combos?(board)
    end

    def winning_token(board)
        if winner?(board)
            # array = split_board_state
            # board.moves.each_with_object(Hash.new(0)) { |v, h| h[v] += 1 }.max_by(&:last)[0]
            freq = board.moves.each_with_object(Hash.new(0)) { |v, h| h[v] += 1 }
            board.moves.max_by { |token| freq[token]}
            # print board.moves.uniq.map { |value| board.moves.count(value) }.max
        end
    end

    def has_winning_combos?(board)
        has_winning_row?(board) || has_winning_column?(board) || has_winning_diagonal?(board)
    end

    def draw?(board)
        board.full? && !has_winning_combos?(board)
    end

    private

    def all_cells_equal?(row)
        return false if row.include?(nil)

        row.each_cons(2).all? { |cell_one, cell_two| cell_one == cell_two }
    end

    def has_winning_row?(board)
        rows = split_board_state(board)
        rows.any? { |row| all_cells_equal?(row)}
    end

    def has_winning_column?(board)
        columns = split_board_state(board)
        columns.transpose.any? { |column| all_cells_equal?(column)}
    end

    def has_winning_diagonal?(board)
        diagonal = split_board_state(board)
        diagonal[0][0] == diagonal[1][1] && diagonal[1][1] == diagonal[2][2] ||
        diagonal[0][2] == diagonal[1][1] && diagonal[1][1] == diagonal[2][0]
    end

    def split_board_state(board)
        board.moves.each_slice(3).to_a
    end
end
