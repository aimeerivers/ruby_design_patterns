require 'sorter'

class QuickSorter < Sorter

  def sort(items)
    size = items.size
    return items if size <= 1

    items = items.dup # Avoid deleting out of original list
    mid_point = size / 2
    mid_point_value = items.delete_at(mid_point)

    lesser, greater = items.partition{|item| item <= mid_point_value}

    [sort(lesser), mid_point_value, sort(greater)].flatten
  end

end
