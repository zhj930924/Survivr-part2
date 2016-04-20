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
      puts "#{member} votes for #{finalists.sample}"
    end
    votes
  end

  def report_votes(final_votes)
    # Print each finalist's votes
    final_votes.each { |f, n| puts "#{f} has #{n} votes" }
  end

  def announce_winner(final_votes)
    # Find finalist object with the most votes
    final_votes.key(final_votes.values.max)
  end
end
