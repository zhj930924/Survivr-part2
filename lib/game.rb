# game.rb
require "colorizr"
class Game
  attr_accessor :tribes

  def initialize(tribe_1, tribe_2)
    @tribes = [tribe_1, tribe_2]
    puts "A new game has been created!".green
    puts "#{@tribes[0].name.yellow} and #{@tribes[1].name.pink} are playing."
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
    tribe = Tribe.new(name: combined_tribe, members: [tribes[0].members + tribes[1].members].flatten!)
    add_tribe(tribe)
    tribe
  end

  def individual_immunity_challenge
    immunity_challenge.members.sample
  end
end
