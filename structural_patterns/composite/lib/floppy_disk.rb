require 'equipment'

class FloppyDisk < Equipment

  def initialize(name)
    @price = 0.50
    super(name)
  end

end
