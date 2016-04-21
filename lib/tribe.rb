# tribe.rb
require "colorizr"
class Tribe
  attr_accessor :name, :members

  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]
    puts "A new tribe has been created!".green
    puts "Tribe name is #{@name.pink}"
    puts "Tribe members are: "
    @members.each { |m| print m.to_s.capitalize.blue + ' ' }
    puts
  end

  def to_s
    @name
  end

  def tribal_council(options = {})
    @immune = options[:immune]
    @members.pop if @members.include?@immune
  end
end
