class MazeGame

  def self.create_maze(factory)
    maze = factory.make_maze

    r1 = factory.make_room(1)
    r2 = factory.make_room(2)

    the_door = factory.make_door(r1, r2)

    maze.add_room(r1)
    maze.add_room(r2)

    r1.set_side(:north, factory.make_wall)
    r1.set_side(:east, the_door)
    r1.set_side(:south, factory.make_wall)
    r1.set_side(:west, factory.make_wall)

    r2.set_side(:north, factory.make_wall)
    r2.set_side(:east, factory.make_wall)
    r2.set_side(:south, factory.make_wall)
    r2.set_side(:west, the_door)

    return maze
  end

end
