class Player
  
  # make name and health readable and writable
  attr_accessor :name
  
  # make health readable
  attr_reader :health
    
  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new(0)
  end
  
  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."    
  end
  
  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end
  
  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end
  
  def score
    @health + @name.length
  end
  
  def strong?
    @health >= 100
  end
  
  def <=>(other)
    other.score <=> score
  end
  
  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasures}"
  end
  
  def points
    @found_treasures.values.reduce(0, :+)
  end

end

if __FILE__ == $0
  player = Player.new("aaron")
  puts player.name
  puts player.health
  player.w00t
  puts player.health
  player.blam
  puts player.health
end