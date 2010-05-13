$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'test/unit'

class TestAbstractFactory < Test::Unit::TestCase

  def test_normal_maze_factory_creates_normal_rooms
    maze = MazeGame.create_maze(MazeFactory.new)
    assert_equal(Room, maze.room_number(1).class)
  end

  def test_enchanted_maze_factory_creates_enchanted_rooms
    maze = MazeGame.create_maze(EnchantedMazeFactory.new)
    assert_not_equal(Room, maze.room_number(1).class)
    assert_equal(EnchantedRoom, maze.room_number(1).class)
  end

  def test_enchanted_maze_factory_creates_doors_needing_spells
    maze = MazeGame.create_maze(EnchantedMazeFactory.new)
    room1 = maze.room_number(1)
    door = room1.get_side(:east)
    assert_equal(DoorNeedingSpell, door.class)
  end

  def test_enchanted_maze_door_cannot_be_entered_without_a_spell
    maze = MazeGame.create_maze(EnchantedMazeFactory.new)
    door = maze.room_number(1).get_side(:east)
    assert_raise ArgumentError do
      door.enter
    end
  end

  def test_enchanted_door_can_be_entered_with_a_spell_in_an_enchanted_room
    maze = MazeGame.create_maze(EnchantedMazeFactory.new)
    room1 = maze.room_number(1)
    spell = room1.spell
    door = room1.get_side(:east)
    assert(door.enter(spell))
  end

  def test_a_normal_room_does_not_need_a_spell
    maze = MazeGame.create_maze(MazeFactory.new)
    room1 = maze.room_number(1)
    door = room1.get_side(:east)
    assert(door.enter)
  end

  def test_bombed_maze_factory_creates_rooms_with_bombs
    maze = MazeGame.create_maze(BombedMazeFactory.new)
    assert_not_equal(Room, maze.room_number(1).class)
    assert_equal(RoomWithABomb, maze.room_number(1).class)
  end

end
