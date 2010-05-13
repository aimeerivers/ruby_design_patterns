require 'maze_factory'

class EnchantedMazeFactory < MazeFactory

  def make_room(room_number)
    EnchantedRoom.new(room_number, cast_spell)
  end

  def make_door(room1, room2)
    DoorNeedingSpell.new(room1, room2)
  end

  protected

  def cast_spell
    Spell.new
  end

end
