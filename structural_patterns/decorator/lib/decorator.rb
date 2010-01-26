require 'christmas_decoration'

class Decorator < ChristmasDecoration

  def initialize(christmas_decoration)
    @christmas_decoration = christmas_decoration
  end

  def decorated?
    true
  end

  def decorations
    @christmas_decoration.decorations
  end

end
