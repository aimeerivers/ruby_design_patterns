class ApproximationCalculator

  # template method
  def self.do_calculation(number)
    guess = initial_guess
    while !close_enough?(guess, number)
      guess = refine_guess(guess, number)
    end
    final_answer(guess)
  end

  # methods that can change
  def self.initial_guess; 1; end

  def self.close_enough?(guess, number); true; end

  def self.refine_guess(guess, number); guess + 1; end

  def self.final_answer(guess); guess; end

end
