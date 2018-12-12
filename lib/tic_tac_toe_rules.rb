class TicTacToeRules
    def winner?(player_stats)
        player_stats = player_stats.sort()
        
        winning_combos = [
            [0,1,2],
            [3,4,5],
            [6,7,8],
            [0,3,6],
            [1,4,7],
            [2,5,8],
            [0,4,8],
            [2,4,6]
        ]

        winning_combos.map do |combo|
            return true if player_stats == combo
        end
    end
end