require_relative 'game'

# Create a new game
game = Game.new("The Keep on the Borderlands")

# Create some players 
player1 = Player.new("aaron", 60)
player2 = Player.new("molvak", 125)
player3 = Player.new("syntha")
player4 = Player.new("klutz", 105)
player5 = Player.new("berserk", 50)

# Add players to a game
game.add_player(player1)
game.add_player(player2)
game.add_player(player3)
game.add_player(player4)
game.add_player(player5)

game.play(2)
game.print_stats
