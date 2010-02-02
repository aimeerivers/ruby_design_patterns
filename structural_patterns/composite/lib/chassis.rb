require 'composite_equipment'

class Chassis < CompositeEquipment

  def initialize(name)
    @price = 35.00
    super(name)
  end

end
