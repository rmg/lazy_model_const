require 'helper'

$called = 0
class SomeModel < OpenStruct
  extend LazyModelConst
  lazy_model_const :IMPORTANT_INSTANCE, name: "imp", desc: "Really really important"
  def self.find_or_create_by_name(attrs = {})
    $called += 1
    new(attrs)
  end
end

class TestLazyModelConst < MiniTest::Unit::TestCase
  def test_lazy_model_const
    assert_equal $called, 0
    instance = SomeModel.IMPORTANT_INSTANCE
    assert_equal $called, 1
    assert_equal instance, SomeModel.IMPORTANT_INSTANCE
    assert_equal $called, 1
    assert_equal instance, SomeModel.IMPORTANT_INSTANCE
    assert_equal $called, 1
  end
end
