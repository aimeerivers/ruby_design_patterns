require 'approximation_calculator'
class SquareRootCalculator < ApproximationCalculator

  def self.close_enough?(guess, number)
    sprintf("%.5f", guess * guess) == sprintf("%.5f", number)
  end

  def self.refine_guess(guess, number)
    guess - (((guess ** 2) - number) / (2 * guess)).to_f
  end

  def self.final_answer(guess)
    ((guess * (10 ** 5)).round) / (10 ** 5).to_f
  end

end
