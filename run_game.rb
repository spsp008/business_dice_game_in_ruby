require "./game.rb"

CELL_ARRAY = ['J', 'H', 'L', 'H', 'E', 'L', 'H', 'L', 'H', 'J']
DICE_OUTPUT = [2,2,1, 4,4,2, 4,4,2, 2,2,1, 4,4,2, 4,4,2, 2,2,1]
# DICE_OUTPUT = [2,2,1, 4,2,3, 4,1,3, 2,2,7, 4,7,2, 4,4,2, 2,2,2]

number_of_users = 3
g = Game.new
g.start_game(number_of_users, CELL_ARRAY, DICE_OUTPUT)
