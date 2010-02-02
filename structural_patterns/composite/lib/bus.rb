require 'composite_equipment'

class Bus < CompositeEquipment

  def initialize(name)
    @price = 14.00
    super(name)
  end

end
