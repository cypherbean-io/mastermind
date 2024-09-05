class Game
  def initialize
    @code_maker = CodeMaker.new
    @code_breaker = CodeBreaker.new
    @secret_code = @code_maker.generate_code
    @max_turns = 12
    @board = Board.new
  end

  def play
    @max_turns.times do |turn|
      puts "\nTurn #{turn + 1} / #{@max_turns}"
      @board.display
      guess = @code_breaker.make_guess
      feedback = @code_maker.provide_feedback(guess, @secret_code)
      @board.update(turn, guess, feedback)
      break if guess == @secret_code
    end
    display_result
  end

  private

  def display_result
    if @board.last_guess == @secret_code
      puts "\nCongratulations! You've cracked the code!"
    else
      puts "\nGame over, you ran out of turns! The secret code was #{@secret_code.join(' ')}."
    end
  end
end
