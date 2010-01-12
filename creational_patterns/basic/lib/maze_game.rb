class MazeGame

  def self.create_maze
    maze = Maze.new

    r1 = Room.new(1)
    r2 = Room.new(2)

    the_door = Door.new(r1, r2)

    maze.add_room(r1)
    maze.add_room(r2)
    
    r1.set_side(:north, Wall.new)
    r1.set_side(:east, the_door)
    r1.set_side(:south, Wall.new)
    r1.set_side(:west, Wall.new)

    r2.set_side(:north, Wall.new)
    r2.set_side(:east, Wall.new)
    r2.set_side(:south, Wall.new)
    r2.set_side(:west, the_door)

    return maze
  end

end
