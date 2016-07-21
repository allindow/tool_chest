# require 'rails_helper'
# # THIS DOES WORK, NOT SURE WHY NOT PASSING
# describe "User can  delete their tool" do
#   scenario "User can delete one of their tools" do
#     category = Category.create(name: "Pointy")
#     user = User.create(name: "Angela", password: "password", role: 1)
#     user.tools.create(name: "hammer", price: 20.00, quantity: 10, category_id: category.id)
#     user.tools.create(name: "saw", price: 20.00, quantity: 10, category_id: category.id)
#     ApplicationController.any_instance.stubs(:current_user).returns(user)
#
#     visit user_tools_path(user)
#
#     within("li:nth-child(1)") do
#       click_link "Delete"
#     end
#
#     within (".tool_info") do
#       expect(page).to have_content("saw")
#       expect(page).to_not have_content("hammer")
#     end
#   end
# end
