$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'test/unit'

class TestIterator < Test::Unit::TestCase

  ### External Iterator ###

  def test_external_iterator_first_value
    iterator = ListIterator.new([1, 2, 3])
    iterator.first
    assert_equal(1, iterator.current_item)
  end

  def test_external_iterator_second_value
    iterator = ListIterator.new([1, 2, 3])
    iterator.next
    assert_equal(2, iterator.current_item)
  end

  def test_external_iterator_iterating_over_values
    iterator = ListIterator.new([1, 2, 3])
    sum = 0
    while !iterator.done?
      sum += iterator.current_item
      iterator.next
    end
    assert_equal(6, sum)
  end

  def test_external_iterator_raises_out_of_bounds_exception
    iterator = ListIterator.new([1, 2, 3])
    iterator.next
    iterator.next
    assert_nothing_raised do
      iterator.current_item
    end
    iterator.next
    assert_raise RuntimeError, 'out of bounds' do
      iterator.current_item
    end
  end

  ### REVERSE External iterator ###

  def test_external_reverse_iterator_first_item
    iterator = ReverseIterator.new([1, 2, 3, 4])
    iterator.first
    assert_equal(4, iterator.current_item)
  end

  def test_external_reverse_iterator_next_item
    iterator = ReverseIterator.new([1, 2, 3, 4])
    iterator.next
    assert_equal(3, iterator.current_item)
  end

  def test_external_reverse_iterator_raises_out_of_bounds_exception
    iterator = ReverseIterator.new([1, 2, 3])
    iterator.next
    iterator.next
    assert_nothing_raised do
      iterator.current_item
    end
    iterator.next
    assert_raise RuntimeError, 'out of bounds' do
      iterator.current_item
    end
  end

  ### INTERNAL ITERATOR ###

  def test_internal_iterator_using_the_each_item_method
    iterator = ListIterator.new([1, 2, 3])
    sum = 0
    iterator.each_item {|item| sum += item}
    assert_equal(6, sum)
  end


  def test_internal_reverse_iterator_using_the_each_item_method
    iterator = ReverseIterator.new([1, 2, 3])
    sum = 0
    iterator.each_item {|item| sum += item}
    assert_equal(6, sum)
  end


end
