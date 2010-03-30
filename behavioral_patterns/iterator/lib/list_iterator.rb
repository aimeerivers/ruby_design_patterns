require 'iterator'

class ListIterator < Iterator

  def initialize(list)
    @list = list
    first
  end

  def first
    @current = 0
  end

  def next
    @current += 1
  end

  def done?
    @current >= @list.size
  end

  def current_item
    raise 'out of bounds' if done?
    @list[@current]
  end

end
