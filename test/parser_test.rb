$LOAD_PATH.unshift(File.expand_path("../../lib", __FILE__))
require "params_tree"
require "minitest/autorun"

class ParserTest < Minitest::Test
  def _(string)
    ParamsTree::Parser.parse string
  end

  def test_nil
    assert_equal _(nil), {}
  end

  def test_blank
    assert_equal _(""), {}
  end

  def test_simple
    assert_equal _("default"), { "default" => {} }
  end

  def test_multiple_simple
    assert_equal _("default, some"), { "default" => {}, "some" => {} }
  end

  def test_nested_simple
    assert_equal _("default(user), some"), { "default" => { 'user' => {} }, "some" => {} }
  end

  def test_double_nested_simple
    assert_equal _("default(user(id)), some"), { "default" => { 'user' => { 'id' => {} }, "some" => {} } }
  end

  def test_complicated
    assert_equal _("default(id,user(group(division(name)),name)),post(id,title),comment(id,author,text(title,body))"), {
      "default" => {
        "id" => {},
        "user" => {
          "group" => {
            "division" => {
              "name" => {}
            },
            "name" => {}
          },
          "post" => {
            "id" => {},
            "title" => {}
          },
          "comment" => {
            "id" => {},
            "author" => {},
            "text" => {
              "title" => {},
              "body" => {}
            }
          }
        }
      }
    }
  end
end
