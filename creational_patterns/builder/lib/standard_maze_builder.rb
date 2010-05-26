require 'maze_builder'

class StandardMazeBuilder < MazeBuilder

  def initialize
    @current_maze = nil
  end

  def build_maze
    @current_maze = Maze.new
  end

  def build_room(room_number)
    room = Room.new(room_number)
    @current_maze.add_room(room)

    room.set_side(:north, Wall.new)
    room.set_side(:south, Wall.new)
    room.set_side(:east, Wall.new)
    room.set_side(:west, Wall.new)
  end

  def build_door(room_from, room_to)
    room1 = @current_maze.room_number(room_from)
    room2 = @current_maze.room_number(room_to)
    door = Door.new(room1, room2)

    # Note. You are supposed to be able to determine a common wall between the two rooms.
    # I don't see how this is possible when the maze does not
    # store positions of rooms relative to each other.
    room1.set_side(:east, door)
    room2.set_side(:west, door)
  end

  def maze
    @current_maze
  end

end
