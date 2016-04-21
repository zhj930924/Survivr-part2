# jury.rb
class Jury
  attr_accessor :members

  def initialize
    @members = []
  end

  def add_member(member)
    @members << member
  end

  def cast_votes(finalists)
    # Initialize vote (each finalist gets 0)
    votes = finalists.map { |f| [f.to_s, 0] }.to_h
    # Each member andomly votes for a finalist
    @members.each do |member|
      votes[finalists.sample.to_s] += 1
      puts "#{member.to_s.capitalize.blue} votes for #{finalists.sample.to_s.capitalize.green}"
    end
    votes
  end

  def report_votes(final_votes)
    # Print each finalist's votes
    final_votes.each { |f, n| puts "#{f.to_s.capitalize.green} has #{n.to_s.yellow} votes" }
  end

  def announce_winner(final_votes)
    # Find finalist object with the most votes
    winner = final_votes.key(final_votes.values.max)
    puts "The WINNER is #{winner.to_s.capitalize.red}!"
    winner
  end
end
