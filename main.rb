require './lib/setup'
require './lib/game'

setup = Setup.new
game = Game.new
setup.start_game_engine(game)