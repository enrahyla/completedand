require_relative 'player_03'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  
  attr_reader :title
  
  def initialize(title)
    @title = title
    @players = []
  end
  
  def add_player(player)
    @players << player
  end
  
  def play(rounds)
    1.upto(rounds) do |round|
      puts "\nRound #{round}:"
      puts "".ljust(50, '=')
      puts "There are #{@players.size} players in #{@title.upcase}"
    
      @players.each do |player|
        puts player
      end
      
      # Show the available treasure
      treasures = TreasureTrove::TREASURES
      puts "\nThere are #{treasures.size} treasures to be found:"
      treasures.each do |treasure|
        puts "A #{treasure.name} is worth #{treasure.points} points"
      end
    
      @players.each do |player|
       GameTurn.take_turn(player)
      end
    end
  end
  
  def print_stats
    puts "\n#{@title} Statistics:\n"

    # Sort players by strength (health > 100)
    strong_players, weak_players = @players.partition { |player| player.strong? }
    
    puts "#{strong_players.size} strong players:"
    strong_players.each do |player|
      print_name_and_health(player)
    end
    puts "#{weak_players.size} weak players:"
    weak_players.each do |player|
      print_name_and_health(player)
    end
    
    # Sort players by high score  
    puts "\n#{@title} High Scores\n"
    @players.sort.each do |player|
      puts "#{player.name.ljust(50, '.')} #{player.score}"
    end
    
    @players.each do |player|
      puts "\n#{player.name}'s point totals:"
      
      # Create a listing of points accumulated on a per-treasure basis
      
      player.each_found_treasure do |treasure|
        puts "#{treasure.name} total points: #{treasure.points}"
      end
      
      # Print the total points: treasure found + health
      
      puts "#{player.points} grand total points"
    end

    # Print the total points scored from all treasure found during the game
    
    puts "\n#{total_points} total points from treasures found"
    
  end
  
  def print_name_and_health(player)
    puts "#{player.name} (#{player.health})"
  end
  
  def total_points
    @players.reduce(0) { |sum, player| sum + player.points }
  end
  
end