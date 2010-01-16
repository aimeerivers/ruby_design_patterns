$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'test/unit'

class TestStrategies < Test::Unit::TestCase

  def setup
    @items = ['Carrots', 'Potatoes', 'Bananas', 'Apples', 'Oranges']
    @sorted_items = ['Apples', 'Bananas', 'Carrots', 'Oranges', 'Potatoes']
  end

  def self.create_sorter_tests
    [BubbleSorter, InsertionSorter, QuickSorter].each do |sorter|
      sorter_name = sorter.to_s.downcase

      # Tests for the list taking the sorter as a strategy

      define_method("test_sorting_with_the_#{sorter_name}", lambda {
        shopping_list = List.new(sorter.new)
        shopping_list.items = @items 
        assert_equal(@sorted_items, shopping_list.sorted_items)
      })

      define_method("test_original_list_remains_unsorted_after_sorting_with_the_#{sorter_name}", lambda {
        shopping_list = List.new(sorter.new)
        shopping_list.items = @items
        shopping_list.sorted_items
        assert_equal(@items, shopping_list.items)
      })

      # Tests for the sorters themselves

      define_method("test_#{sorter_name}_sorting_no_items", lambda {
        assert_equal([], sorter.new.sort([]))
      })

      define_method("test_#{sorter_name}_sorting_one_item", lambda {
        assert_equal(['a'], sorter.new.sort(['a']))
      })

      define_method("test_#{sorter_name}_sorting_two_items_which_are_already_sorted", lambda {
        assert_equal(['a', 'b'], sorter.new.sort(['a', 'b']))
      })

      define_method("test_#{sorter_name}_sorting_two_items_which_are_in_the_wrong_order", lambda {
        assert_equal(['a', 'b'], sorter.new.sort(['b', 'a']))
      })

      define_method("test_#{sorter_name}_sorting_some_random_words", lambda {
        assert_equal(['conker', 'hopscotch', 'summer', 'whisky'], sorter.new.sort(['hopscotch', 'whisky', 'conker', 'summer']))
      })

      define_method("test_#{sorter_name}_sorting_numbers", lambda {
        assert_equal([1, 2, 3, 4, 5], sorter.new.sort([3, 2, 5, 1, 4]))
      })

      define_method("test_#{sorter_name}_sorting_a_large_range_of_already_sorted_numbers", lambda {
        list = (1..1000).to_a
        assert_equal(list, sorter.new.sort(list))
      })

      define_method("test_#{sorter_name}_sorting_a_large_range_of_numbers_in_reverse_order", lambda {
        list = (1..1000).to_a
        assert_equal(list, sorter.new.sort(list.reverse))
      })

    end
  end
end

TestStrategies.create_sorter_tests
