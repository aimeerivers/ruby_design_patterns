$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'test/unit'

class TestBuilder < Test::Unit::TestCase

  def test_maze_can_be_created_with_the_standard_builder
    maze = MazeGame.create_maze(StandardMazeBuilder.new)
    assert_equal(Maze, maze.class)
  end

  def test_maze_contains_rooms
    maze = MazeGame.create_maze(StandardMazeBuilder.new)
    assert_equal(Room, maze.room_number(1).class)
    assert_equal(Room, maze.room_number(2).class)
  end

  def test_rooms_can_be_entered
    maze = MazeGame.create_maze(StandardMazeBuilder.new)
    room = maze.room_number(1)
    assert(room.enter)
  end

  def test_rooms_have_walls
    maze = MazeGame.create_maze(StandardMazeBuilder.new)
    room1 = maze.room_number(1)
    assert_equal(Wall, room1.get_side(:north).class)
  end

  def test_walls_cannot_be_entered
    maze = MazeGame.create_maze(StandardMazeBuilder.new)
    wall = maze.room_number(1).get_side(:north)
    assert_equal(false, wall.enter)
  end

  def test_rooms_have_doors
    maze = MazeGame.create_maze(StandardMazeBuilder.new)
    room1 = maze.room_number(1)
    assert_equal(Door, room1.get_side(:east).class)
    room2 = maze.room_number(2)
    assert_equal(Door, room2.get_side(:west).class)
  end

  def test_open_doors_can_be_entered
    maze = MazeGame.create_maze(StandardMazeBuilder.new)
    door = maze.room_number(1).get_side(:east)
    assert(door.open?)
    assert(door.enter)
  end

  def test_the_two_rooms_share_the_same_door
    maze = MazeGame.create_maze(StandardMazeBuilder.new)
    room1 = maze.room_number(1)
    room2 = maze.room_number(2)
    assert_equal(room1.get_side(:east), room2.get_side(:west))
  end

  def test_the_two_rooms_have_different_walls
    maze = MazeGame.create_maze(StandardMazeBuilder.new)
    room1 = maze.room_number(1)
    room2 = maze.room_number(2)
    assert_not_equal(room1.get_side(:south), room2.get_side(:south))
  end

  def test_you_can_get_through_the_door_from_one_room_to_the_other
    maze = MazeGame.create_maze(StandardMazeBuilder.new)
    room1 = maze.room_number(1)
    room2 = maze.room_number(2)
    door = room1.get_side(:east)
    assert_equal(door.other_side_from(room1), room2)
  end

  def test_you_cannot_instantiate_the_superclass_maze_builder
    assert_raise(RuntimeError) { MazeBuilder.new }
  end

  def test_alternative_maze_creation
    maze = MazeGame.create_complex_maze(StandardMazeBuilder.new)
    assert_not_nil(maze.room_number(1001))
    assert_nil(maze.room_number(1002))
  end

  def test_alternative_counting_builder
    counting_builder = CountingMazeBuilder.new
    maze = MazeGame.create_maze(counting_builder)
    assert_equal(2, counting_builder.get_counts[:rooms])
    assert_equal(1, counting_builder.get_counts[:doors])
  end

  def test_the_counting_builder_does_not_actually_return_a_maze
    counting_builder = CountingMazeBuilder.new
    maze = MazeGame.create_maze(counting_builder)
    assert_nil(counting_builder.maze)
  end

  def test_counting_builder_for_complex_maze
    counting_builder = CountingMazeBuilder.new
    maze = MazeGame.create_complex_maze(counting_builder)
    assert_equal(1001, counting_builder.get_counts[:rooms])
    assert_equal(0, counting_builder.get_counts[:doors])
  end

end
