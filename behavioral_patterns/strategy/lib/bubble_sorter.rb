require 'sorter'

class BubbleSorter < Sorter

  def sort(items)
    limit = items.size
    return items if limit <= 1

    begin
      something_changed = false
      for i in 1..(limit - 1) do
        if items[i-1] > items[i]
          items[i-1], items[i] = items[i], items[i-1]
          something_changed = true
        end
      end
      limit -= 1
    end while something_changed

    items
  end

end
