class BoardPresenter
    # def display_board
    #     "        |      |      #{horizontal_bar}        |      |      #{horizontal_bar}        |      |     \n"
    # end
    def display_board(board)
        "    #{board[0]}    |   #{board[1]}   |    #{board[2]}  #{horizontal_bar}    #{board[3]}    |   #{board[4]}   |    #{board[5]}  #{horizontal_bar}    #{board[6]}    |   #{board[7]}   |   #{board[8]}  \n"
    end

    private

    def horizontal_bar
        "\n--------------------------\n"
    end
end
