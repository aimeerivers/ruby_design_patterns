class MazeBuilder

  def initialize
    raise 'Please initialize a subclass.'
  end

  def build_maze
  end

  def build_room(room_number)
  end

  def build_door(room_from, room_to)
  end

  def maze
    nil
  end

end
