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
