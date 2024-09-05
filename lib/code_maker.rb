class CodeMaker
  COLORS = %w[1 2 3 4 5 6].freeze

  def initialize; end

  def generate_code
    Array.new(4) { COLORS.sample }
  end

  def provide_feedback(guess, secret_code)
    exact = exact_matches(guess, secret_code)
    color = color_matches(guess, secret_code) - exact
    { exact: exact, color: color }
  end

  def exact_matches(guess, secret_code)
    guess.zip(secret_code).count { |a, b| a == b }
  end

  def color_matches(guess, secret_code)
    guess_tally = guess.tally
    secret_tally = secret_code.tally
    COLORS.sum { |color| [guess_tally[color] || 0, secret_tally[color] || 0].min }
  end
end
