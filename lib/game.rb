class Game
  def initialize
    @max_turns = 12
  end

  def play
    @max_turns.times do |turn|
      puts "Turn #{turn + 1}: Enter your guess"
      guess = gets.chomp
      puts guess
    end
  end
end
