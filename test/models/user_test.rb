require "test_helper"

class UserTest < ActiveSupport::TestCase

  def test_user_has_tools
    user = User.create(name: "Angela", password: "password")
    user.tools.create(name: "hammer", price: 20.00, quantity: 1)

    assert_instance_of Tool, user.tools.first
  end
end
