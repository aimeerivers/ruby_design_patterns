require 'equipment'

class CompositeEquipment < Equipment

  def initialize(name)
    @items = []
    super(name)
  end

  def add(equipment)
    @items << equipment
  end

  def net_price
    @items.inject(@price) do |sum, item|
      sum += item.net_price
    end
  end

end
