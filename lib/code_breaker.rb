class CodeBreaker
  def initialize; end

  def valid_guess?(guess)
    guess.length == 4 && guess.all? { |num| ('1'..'6').include?(num) }
  end

  def make_guess
    loop do
      print 'Enter your guess (4 numbers between 1 and 6, space-separated): '
      guess = gets.chomp.split
      return guess if valid_guess?(guess)

      puts 'Invalid guess. Try again.'
    end
  end
end
