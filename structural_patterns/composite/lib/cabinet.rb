require 'composite_equipment'

class Cabinet < CompositeEquipment

  def initialize(name)
    @price = 275.00
    super(name)
  end

end
