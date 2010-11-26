$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'test/unit'

class TestSingleton < Test::Unit::TestCase

  def test_getting_first_instance
    maze_factory = MazeFactory.instance
    assert maze_factory.is_a?(MazeFactory)
  end

  def test_next_instance_is_the_same_as_the_first
    maze_factory = MazeFactory.instance
    assert_equal(MazeFactory.instance, maze_factory)
  end

  def test_new_cannot_be_called
    assert_raise NoMethodError do
      MazeFactory.new
    end
  end

end
