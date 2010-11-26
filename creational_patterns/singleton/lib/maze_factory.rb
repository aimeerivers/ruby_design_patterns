class MazeFactory

  private_class_method :new

  def self.instance
    @@instance ||= new
    @@instance
  end

end
