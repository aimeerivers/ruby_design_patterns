$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'test/unit'

class TestDecorator < Test::Unit::TestCase

  def test_undecorated_christmas_tree
    tree = ChristmasTree.new
    assert_equal(false, tree.decorated?)
  end

  def test_basic_undecorated_tree
    tree = ChristmasTree.new
    assert_equal('TREE', tree.decorations)
  end

  def test_decorating_a_tree_with_lights
    tree = LightsDecorator.new(ChristmasTree.new)
    assert(tree.decorated?)
  end

  def test_decoration_on_the_tree
    tree = LightsDecorator.new(ChristmasTree.new)
    assert_equal('LIGHTS, TREE', tree.decorations)
  end

  def test_lights_and_baubels_on_the_tree
    tree = BaubelDecorator.new(LightsDecorator.new(ChristmasTree.new))
    assert_equal('BAUBELS, LIGHTS, TREE', tree.decorations)
  end

  def test_beautiful_super_decorated_tree
    tree = LightsDecorator.new(TinselDecorator.new(LightsDecorator.new(BaubelDecorator.new(ChristmasTree.new))))
    assert_equal('LIGHTS, TINSEL, LIGHTS, BAUBELS, TREE', tree.decorations)
  end

  def test_you_need_to_decorate_a_tree
    assert_raise ArgumentError do
      LightsDecorator.new(TinselDecorator.new)
    end
  end

end
