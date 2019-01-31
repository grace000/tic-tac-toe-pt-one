class BoardPresenter
    
    def display_board(board)
        <<~HEREDOC
        \n
            #{board[0]}    |   #{board[1]}   |    #{board[2]}
          --------------------------\n
            #{board[3]}    |   #{board[4]}   |    #{board[5]}
          --------------------------\n
            #{board[6]}    |   #{board[7]}   |    #{board[8]}\n   
        HEREDOC
    end
end
 