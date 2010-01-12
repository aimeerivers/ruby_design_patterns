require 'maze_game'

class BombedMazeGame < MazeGame

  # Override two of the factory methods ...

  def self.make_wall
    BombedWall.new
  end

  def self.make_room(room_number)
    RoomWithABomb.new(room_number)
  end

end
