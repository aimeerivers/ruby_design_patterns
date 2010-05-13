require 'room'

class EnchantedRoom < Room

  attr_reader :spell

  def initialize(room_number, spell)
    @spell = spell
    super(room_number)
  end

end
