require 'maze_game'

class EnchantedMazeGame < MazeGame
  
  # Override two of the factory methods ...

  def self.make_room(room_number)
    EnchantedRoom.new(room_number, cast_spell)
  end

  def self.make_door(room1, room2)
    DoorNeedingSpell.new(room1, room2)
  end

  protected

  def self.cast_spell
    Spell.new
  end

end
