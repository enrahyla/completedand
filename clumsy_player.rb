require_relative 'player'

class ClumsyPlayer < player
end

def found_treasure(treasure)
	points = treasure.points / 2.0
	@found_treasures[treasure.name] += points
	puts "#{@name} found a #{treasure.name} worth #{treasure.points} points"
end

if _FILE_ == $0
	clumsy = ClumsyPlayer.new("klutz")

	hammer = Treasure.new(:hammer, 25)
	clumsy.found_treasure(hammer)
	clumsy.found_treasure(hammer)
	clumsy.found_treasure(hammer)

	crowbar = Treasure.new(:crowbar, 200)
	clumsy.found_treasure(crowbar)

	clumsy.each_found_treasure do |treasure|
		puts "#{treasure.points} total #{treasure.name} points"
	end
	puts "#{clumsy.points} grand total points"
end
