class BoardPresenter
    def display_board
        "        |      |      #{horizontal_bar}        |      |      #{horizontal_bar}        |      |     \n"
    end

    private

    def horizontal_bar
        "\n--------------------------\n"
    end
end
