require 'iterator'

class ReverseIterator < Iterator

  def initialize(list)
    @list = list
    first
  end

  def first
    @current = @list.size - 1
  end

  def next
    @current -= 1
  end

  def done?
    @current < 0
  end

  def current_item
    raise 'out of bounds' if done?
    @list[@current]
  end

end
