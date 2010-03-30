$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'test/unit'

class TestTemplateMethod < Test::Unit::TestCase

  def test_square_root_of_9
    assert_equal(3, SquareRootCalculator.do_calculation(9))
  end

  def test_square_root_of_100
    assert_equal(10, SquareRootCalculator.do_calculation(100))
  end

  def test_square_root_of_1
    assert_equal(1, SquareRootCalculator.do_calculation(1))
  end

  def test_square_root_of_2
    assert_equal(1.41421, SquareRootCalculator.do_calculation(2))
  end

end
