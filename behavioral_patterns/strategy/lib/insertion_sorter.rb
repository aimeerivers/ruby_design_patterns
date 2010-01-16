require 'sorter'

class InsertionSorter < Sorter

  def sort(items)
    size = items.size
    return items if size <= 1

    for array_index in 1..(size - 1)
      selected_item = items[array_index]

      comparer_index = array_index - 1
      while comparer_index >= 0 && items[comparer_index] > selected_item
        # Shuffle up
        items[comparer_index + 1] = items[comparer_index]
        comparer_index -= 1
      end
      items[comparer_index + 1] = selected_item
    end

    items
  end

end
