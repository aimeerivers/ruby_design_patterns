$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), 'lib'))
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each {|file| require file }

require 'test/unit'

class TestComposite < Test::Unit::TestCase

  def test_empty_cabinet
    cabinet = Cabinet.new("PC Cabinet")
    assert_equal(275.00, cabinet.net_price)
  end

  def test_buying_a_floppy_disk_on_its_own
    floppy = FloppyDisk.new("3.5in Floppy")
    assert_equal(0.50, floppy.net_price)
  end

  def test_empty_chassis
    chassis = Chassis.new("PC Chassis")
    assert_equal(35.00, chassis.net_price)
  end

  def test_composing_a_cabinet_and_a_chassis
    cabinet = Cabinet.new("PC Cabinet")
    chassis = Chassis.new("PC Chassis")
    cabinet.add(chassis)
    assert_equal(310.00, cabinet.net_price)
  end

  def test_empty_bus
    bus = Bus.new("MCA Bus")
    assert_equal(14.00, bus.net_price)
  end

  def test_buying_a_card_on_its_own
    card = Card.new("16Mbs TokenRing")
    assert_equal(11.35, card.net_price)
  end

  def test_adding_a_card_to_a_bus
    bus = Bus.new("MCA Bus")
    bus.add(Card.new("16Mbs Token Ring"))
    assert_equal(25.35, bus.net_price)
  end

  def test_composing_the_whole_lot
    cabinet = Cabinet.new("PC Cabinet")
    chassis = Chassis.new("PC Chassis")
    cabinet.add(chassis)
    bus = Bus.new("MCA Bus")
    bus.add(Card.new("16Mbs Token Ring"))
    chassis.add(bus)
    chassis.add(FloppyDisk.new("3.5in Floppy"))
    assert_equal(335.85, cabinet.net_price)
  end

end
