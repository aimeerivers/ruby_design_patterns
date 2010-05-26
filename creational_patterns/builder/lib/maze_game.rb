class MazeGame

  def self.create_maze(builder)
    builder.build_maze

    builder.build_room(1)
    builder.build_room(2)
    builder.build_door(1, 2)

    return builder.maze
  end

  def self.create_complex_maze(builder)
    builder.build_maze

    (1..1001).each do |number|
      builder.build_room(number)
    end

    return builder.maze
  end

end
