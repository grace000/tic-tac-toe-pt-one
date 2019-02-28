require_relative './game_results'

class HardComputerPlayer
    attr_accessor :token, :name, :game_results
    
    def initialize(args)
        @token = args[:token]
        @name = "Computer"
        @game_results = GameResults.new 
    end

    def select_coordinate(board, players)
        get_best_computer_move(board, players)
    end

    def get_best_computer_move(board, players)
        best_move_score = -1000
        best_move = nil
        board.empty_spaces.each do |current_move|
            board.update(self.token, current_move)
            current_score = get_best_move_score(board, players, 0, false)
            if current_score > best_move_score 
                best_move_score = current_score
                best_move = current_move
            end
            board.moves[current_move] = current_move
        end
        best_move
    end

    def get_best_move_score(board, players, depth, is_maximizing_player)
        score = evaluate_board(board)

        return score if score == 10
        return score if score == -10
        return score if score == 0

        if is_maximizing_player
            best_score = -1000

            board.empty_spaces do |move|
                board.update(self.token, move)
                best_score = [best_score, get_best_move_score(board, players, depth+1, !is_maximizing_player)].max
                board.moves[move-1] = move
            end
            print best_score
            best_score
        else
            best_score = 1000

            board.empty_spaces do |move|
                board.update(players[0].token,move)
                best_score = [best_score, get_best_move_score(board, players, depth+1, !is_maximizing_player)].min
                board.moves[move-1] = move
            end
            best_score
        end
    end

    def evaluate_board(board)
        return 10 if @game_results.winning_token(board) == self.token
        return 0 if @game_results.draw?(board)
        return -10 if @game_results.winning_token(board) != self.token
    end
end