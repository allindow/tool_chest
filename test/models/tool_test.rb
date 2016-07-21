require "test_helper"

class ToolTest < ActiveSupport::TestCase

  def test_tool_belongs_to_a_user
    user = User.create(name: "Angela", password: "password")
    tool = user.tools.create(name: "hammer", price: 20.00, quantity: 1)

    assert_equal user, tool.user
  end
end
