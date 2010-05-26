class Maze

  def initialize
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def room_number(number)
    @rooms.find{|room| room.room_number == number}
  end

end
