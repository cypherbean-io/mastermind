class Game
  def initialize
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
    @secret_code = @code_maker.generate_code
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
