class Iterator

  def first; 0; end
  def next; 0; end
  def done?; false; end
  def current_item; 0; end

  def each_item
    while !done?
      yield current_item
      self.next
    end
  end

  protected
  def initialize; end

end
