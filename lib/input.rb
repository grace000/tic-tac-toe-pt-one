class Input
    INPUT_PROMPT = "Please make a selection"

    def get_input
        $stdin.gets.chomp.upcase
    end
end