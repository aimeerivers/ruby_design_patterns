require 'maze_factory'

class BombedMazeFactory < MazeFactory

  def make_wall
    BombedWall.new
  end

  def make_room(room_number)
    RoomWithABomb.new(room_number)
  end

end
