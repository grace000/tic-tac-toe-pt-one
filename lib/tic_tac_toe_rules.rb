class TicTacToeRules
    def winner?(player_stats)
        player_stats = player_stats.sort()
        match_box = []
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
            match_box = []
            player_stats.map do |stat|
                if combo.include?(stat)
                    match_box << stat
                end
            end
            return true if match_box.length == 3
        end
    end
end
