# game.rb
class Game
  attr_reader :tribes

  def initialize(tribe_1, tribe_2)
    @tribes = [tribe_1, tribe_2]
    puts "A new game has been created!"
    puts "#{@tribes[0].name} and #{@tribes[1].name} are playing."
  end

  def add_tribe(tribe)
    @tribes << tribe
  end

  def immunity_challenge
    @tribes.sample
  end

  def clear_tribes
    @tribes.clear
  end

  def merge(combined_tribe)
    Tribe.new(name: combined_tribe, members: [tribes[0].members + tribes[1].members].flatten!)
  end

  def individual_immunity_challenge
    @tribes.sample.members.pop
  end
end
