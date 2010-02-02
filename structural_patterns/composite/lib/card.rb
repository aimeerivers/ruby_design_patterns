require 'equipment'

class Card < Equipment

  def initialize(name)
    @price = 11.35
    super(name)
  end

end
