require_relative 'player'
require_relative 'treasure_trove'

describe Player do

  before do 
    # Redirect the output from the console
    $stdout = StringIO.new
    
    # Set initial health value and player
    @initial_health = 150
    @player = Player.new("aaron", @initial_health)
  end
  
  it "has a capitalized name" do
    @player.name.should == "Aaron"
  end
  
  it "has an initial health" do
    @player.health.should == 150
  end
  
  it "has a string representation" do
    @player.to_s.should == "I'm Aaron with a health of 150 and a score of #{@player.score}."
  end
  
  it "computes a score as the sum of its health and points" do
    @player.found_treasure(Treasure.new(:hammer, 50))
    @player.found_treasure(Treasure.new(:hammer, 50))

    @player.score.should == 250
  end
  
  it "increases health by 15 when w00ted" do
    @player.w00t

    @player.health.should == @initial_health + 15
  end
  
  it "decreases health by 10 when blammed" do  
    @player.blam

    @player.health.should == @initial_health - 10
  end

  # Create a strong player
  context "with a health greater than 100" do
    
    it "is strong" do
      @player.should be_strong
    end
  end
  
  # Create a weak player
  context "with a health less than 100" do
    
    before do
      @player = Player.new("aaron", 90)
    end
    
    it "is weak" do
      @player.should_not be_strong
    end
  end
  
  context "in a collection of players" do
    before do
      @player1 = Player.new("aaron", 100)
      @player2 = Player.new("molvak", 200)
      @player3 = Player.new("syntha", 300)

      @players = [@player1, @player2, @player3]
    end

    it "is sorted by decreasing score" do
      @players.sort.should == [@player3, @player2, @player1]
    end
  end
  
end