class List

  attr_accessor :items

  def initialize(sorting_strategy)
    @sorting_strategy = sorting_strategy
    @items = []
  end

  def sorted_items
    @sorting_strategy.sort(@items)
  end

end
