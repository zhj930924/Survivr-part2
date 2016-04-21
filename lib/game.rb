# game.rb
require "colorizr"
class Game
  attr_reader :tribes

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
    Tribe.new(name: combined_tribe, members: [tribes[0].members + tribes[1].members].flatten!)
  end

  def individual_immunity_challenge
    @tribes.sample.members.shuffle.pop
  end
end
