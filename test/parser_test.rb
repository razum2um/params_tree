$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))
require "minitest/autorun"

class ParserTest < Minitest::Test
  def _(string)
    ParamsTree::Parser.parse _
  end

  def test_simple
    assert_equal _("default"), { "default" => {} }
  end

  def test_multiple_simple
    assert_equal _("default, some"), { "default" => {} }
  end
end
