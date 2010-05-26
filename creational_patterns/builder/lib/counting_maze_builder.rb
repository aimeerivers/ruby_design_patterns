require 'maze_builder'

class CountingMazeBuilder < MazeBuilder

  def initialize
    @rooms = @doors = 0
  end

  def build_room(room_number)
    @rooms += 1
  end

  def build_door(room_from, room_to)
    @doors += 1
  end

  def get_counts
    {:rooms => @rooms, :doors => @doors}
  end

end
