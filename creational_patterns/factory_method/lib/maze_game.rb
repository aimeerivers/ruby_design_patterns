class MazeGame

  def self.create_maze
    maze = make_maze

    r1 = make_room(1)
    r2 = make_room(2)

    the_door = make_door(r1, r2)

    maze.add_room(r1)
    maze.add_room(r2)
    
    r1.set_side(:north, make_wall)
    r1.set_side(:east, the_door)
    r1.set_side(:south, make_wall)
    r1.set_side(:west, make_wall)

    r2.set_side(:north, make_wall)
    r2.set_side(:east, make_wall)
    r2.set_side(:south, make_wall)
    r2.set_side(:west, the_door)

    return maze
  end

  # Factory methods ...

  def self.make_maze
    Maze.new
  end

  def self.make_room(room_number)
    Room.new(room_number)
  end

  def self.make_wall
    Wall.new
  end

  def self.make_door(room1, room2)
    Door.new(room1, room2)
  end

end
