$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'test/unit'

class TestBasicMaze < Test::Unit::TestCase

  def test_maze_game_creates_a_maze
    assert_equal(MazeGame.create_maze.class, Maze)
  end

  def test_maze_contains_rooms
    maze = MazeGame.create_maze
    assert_equal(maze.room_number(1).class, Room)
    assert_equal(maze.room_number(2).class, Room)
  end

  def test_rooms_can_be_entered
    maze = MazeGame.create_maze
    room = maze.room_number(1)
    assert(room.enter)
  end

  def test_rooms_have_walls
    maze = MazeGame.create_maze
    room1 = maze.room_number(1)
    assert_equal(room1.get_side(:north).class, Wall)
  end

  def test_walls_cannot_be_entered
    maze = MazeGame.create_maze
    wall = maze.room_number(1).get_side(:north)
    assert_equal(wall.enter, false)
  end

  def test_rooms_have_doors
    maze = MazeGame.create_maze
    room1 = maze.room_number(1)
    assert_equal(room1.get_side(:east).class, Door)
    room2 = maze.room_number(2)
    assert_equal(room2.get_side(:west).class, Door)
  end

  def test_open_doors_can_be_entered
    maze = MazeGame.create_maze
    door = maze.room_number(1).get_side(:east)
    assert(door.open?)
    assert(door.enter)
  end

  def test_the_two_rooms_share_the_same_door
    maze = MazeGame.create_maze
    room1 = maze.room_number(1)
    room2 = maze.room_number(2)
    assert_equal(room1.get_side(:east), room2.get_side(:west))
  end

  def test_the_two_rooms_have_different_walls
    maze = MazeGame.create_maze
    room1 = maze.room_number(1)
    room2 = maze.room_number(2)
    assert_not_equal(room1.get_side(:south), room2.get_side(:south))
  end

  def test_you_can_get_through_the_door_from_one_room_to_the_other
    maze = MazeGame.create_maze
    room1 = maze.room_number(1)
    room2 = maze.room_number(2)
    door = room1.get_side(:east)
    assert_equal(door.other_side_from(room1), room2)
  end

end
