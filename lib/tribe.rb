# tribe.rb
class Tribe
  attr_accessor :name, :members

  def initialize(options = {})
    @name = options[:name]
    @members = options[:members]
    puts "#{name}, #{members}"
  end

  def to_s
    @name
  end

  def tribal_council(options = {})
    @immune = options[:immune]
    @members.pop if @members.include?@immune
  end
end
