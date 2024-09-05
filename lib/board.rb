class Board
  def initialize
    @guesses = []
    @feedback = []
  end

  def update(turn, guess, feedback)
    @guesses[turn] = guess
    @feedback[turn] = feedback
  end

  def display
    @guesses.each_with_index do |guess, index|
      display_row(guess, @feedback[index], index)
    end
  end

  def last_guess
    @guesses.last
  end

  private

  def display_row(guess, feedback, index)
    return if guess.nil?

    puts "#{index + 1}: #{guess.join(' ')} | Exact: #{feedback[:exact]}, Color: #{feedback[:color]}"
  end
end
