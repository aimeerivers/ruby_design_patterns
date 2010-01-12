require 'map_site'

class Room < MapSite

  attr_reader :room_number

  def initialize(room_number)
    @room_number = room_number
    @sides = {}
  end

  def enter
    true
  end

  def set_side(side, map_site)
    @sides[side] = map_site
  end

  def get_side(side)
    @sides[side]
  end

end
