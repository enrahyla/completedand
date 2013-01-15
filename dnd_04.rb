require_relative 'game_04'

# Create a new game
game = Game.new("The Keep on the Borderlands")

# Create some players 
player1 = Player.new("aaron", 60)
player2 = Player.new("molvak", 125)
player3 = Player.new("syntha")

# Add players to a game
game.add_player(player1)
game.add_player(player2)
game.add_player(player3)

# Play the game x times, if the points total exceeds 2000, end the game
game.play(10) do
  game.total_points >= 2000
end

# Print out all the stats for the game
game.print_stats
