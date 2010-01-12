$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'test/unit'

class TestFactoryMethod < Test::Unit::TestCase

  def test_normal_maze_creates_normal_rooms
    maze = MazeGame.create_maze
    assert_equal(maze.room_number(1).class, Room)
  end

  def test_enchanted_maze_creates_enchanted_rooms
    maze = EnchantedMazeGame.create_maze
    assert_not_equal(maze.room_number(1).class, Room)
    assert_equal(maze.room_number(1).class, EnchantedRoom)
  end

  def test_bombed_maze_creates_rooms_with_bombs
    maze = BombedMazeGame.create_maze
    assert_not_equal(maze.room_number(1).class, Room)
    assert_equal(maze.room_number(1).class, RoomWithABomb)
  end

  def test_enchanted_maze_creates_doors_needing_spells
    maze = EnchantedMazeGame.create_maze
    room1 = maze.room_number(1)
    door = room1.get_side(:east)
    assert_equal(door.class, DoorNeedingSpell)
  end

  def test_enchanted_maze_door_cannot_be_entered_without_a_spell
    maze = EnchantedMazeGame.create_maze
    door = maze.room_number(1).get_side(:east)
    assert_raise ArgumentError do
      door.enter
    end
  end

  def test_enchanted_door_can_be_entered_with_a_spell_in_an_enchanted_room
    maze = EnchantedMazeGame.create_maze
    room1 = maze.room_number(1)
    spell = room1.spell
    door = room1.get_side(:east)
    assert(door.enter(spell))
  end

  def test_a_normal_room_does_not_need_a_spell
    maze = MazeGame.create_maze
    room1 = maze.room_number(1)
    door = room1.get_side(:east)
    assert(door.enter)
  end

end

