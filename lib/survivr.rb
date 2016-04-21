require_relative "game"
require_relative "tribe"
require_relative "contestant"
require_relative "jury"

#After your tests pass, uncomment this code below
#=========================================================
# Create an array of twenty hopefuls to compete on the island of Borneo
@contestants = %w(carlos walter aparna trinh diego juliana poornima juha sofia julia fernando dena orit colt zhalisa farrin muhammed ari rasha gauri)
@contestants.map!{ |contestant| Contestant.new(contestant) }.shuffle!
# Create two new tribes with names
@coyopa = Tribe.new(name: "Pagong", members: @contestants.shift(10))
puts
@hunapu = Tribe.new(name: "Tagi", members: @contestants.shift(10))
puts

# Create a new game of Survivor
@borneo = Game.new(@coyopa, @hunapu)
puts
#=========================================================


#This is where you will write your code for the three phases

def phase_one
  8.times do
    loser = @borneo.individual_immunity_challenge
    puts "#{loser.to_s.capitalize} has been eliminated!"
  end
end

def phase_two
  3.times do
    loser = @merge_tribe.tribal_council(immune: @merge_tribe.members.first)
    puts "#{loser.to_s.capitalize} has been eliminated!"
  end
end

# Goal is 2 finalists and 7 jury
def phase_three
  7.times do |n|
    result = @merge_tribe.tribal_council(immune: @merge_tribe.members.first)
    puts "#{result.to_s.capitalize} has joined the jury! The jury has #{n + 1} members now."
    @jury.add_member(result)
  end
end

# If all the tests pass, the code below should run the entire simulation!!
#=========================================================
puts "*" * "Phase One: Pre-Merge".length
puts "Phase One: Pre-Merge"
puts "*" * "Phase One: Pre-Merge".length
phase_one #8 eliminations
puts
puts "The remaining 12 contestants have been merged."
@merge_tribe = @borneo.merge("Cello") # After 8 eliminations, merge the two tribes together
puts
puts "*" * "Phase Two: Merge".length
puts "Phase Two: Merge"
puts "*" * "Phase Two: Merge".length
phase_two #3 more eliminations
puts
@jury = Jury.new
puts "*" * "Phase Three: Jury Phase".length
puts "Phase Three: Jury Phase"
puts "*" * "Phase Three: Jury Phase".length
phase_three #7 elminiations become jury members
puts
finalists = @merge_tribe.members #set finalists
puts "The finalists are #{finalists[0].to_s.capitalize} and #{finalists[1].to_s.capitalize}."
puts
puts "*" * "Final Tribal Council".length
puts "Final Tribal Council"
puts "*" * "Final Tribal Council".length
vote_results = @jury.cast_votes(finalists) #Jury members report votes
@jury.report_votes(vote_results) #Jury announces their votes
puts
@jury.announce_winner(vote_results) #Jury announces final winner
