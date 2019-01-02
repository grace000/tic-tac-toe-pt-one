require "run"
require "stringio"


describe "#get_players" do
    after do
        $stdin = STDIN
    end
    
    it "returns number of human players" do
        string_io = StringIO.new
        string_io.puts '1'
        string_io.rewind
        $stdin = string_io

        expect(get_players).to eq('1')
    end
end

describe "#get_player_token" do
    after do
        $stdin = STDIN
    end

    it "returns token selected by player" do
        string_io = StringIO.new
        string_io.puts 'X'
        string_io.rewind
        $stdin = string_io

        expect(get_player_token).to eq('X')
    end
end

describe "#display_board" do
    it "displays a board with no player marks" do
        expect(display_board).to eq(
            <<~HEREDOC
                    |     |      
            --------------------------
                    |     |      
            --------------------------
                    |     |     
            HEREDOC
        )
    end
end

describe "#assign_token" do
    after do
        $stdin = STDIN
    end

    it "assigns the second player with a token" do
        string_io = StringIO.new
        string_io.puts 'X'
        string_io.rewind
        $stdin = string_io

        expect(assign_token).to eq('O')
    end

    it "assigns the second player with a token" do
        string_io = StringIO.new
        string_io.puts 'O'
        string_io.rewind
        $stdin = string_io

        expect(assign_token).to eq('X')
    end
end