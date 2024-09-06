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

    guess_str = guess.map { |num| num.colorize(color: color(num)) }.join(' ')
    feedback_str = ('●'.red * feedback[:exact]) + ('●'.white * feedback[:color]).ljust(4)
    puts "#{index + 1}: #{guess_str} | #{feedback_str}"
  end

  def color(num)
    %i[red green yellow blue magenta cyan] [num.to_i - 1]
  end
end
