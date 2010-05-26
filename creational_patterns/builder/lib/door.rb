require 'map_site'

class Door < MapSite

  def initialize(room1, room2)
    @room1 = room1
    @room2 = room2
    @is_open = true
  end

  def open?
    @is_open
  end

  def enter
    open?
  end

  def other_side_from(room)
    return nil unless [@room1, @room2].include?(room)
    [@room1, @room2].reject{|r| r == room}[0]
  end

end
