require 'rails_helper'

describe "User can see their tools" do
  scenario "Sees their own but not someone else's" do
    category = Category.create(name: "Pointy")
    user = User.create(name: "Angela", password: "password", role: 1)
    user2 = User.create(name: "Bert", password: "pineapple", role: 1)
    user.tools.create(name:"Chainsaw", price: 699.99, quantity: 1, category_id: category.id)
    user2.tools.create(name:"Table", price: 300.45, quantity: 2, category_id: category.id)
    ApplicationController.any_instance.stubs(:current_user).returns(user)

    visit user_tools_path(user)

    within (".tool_info") do
      expect(page).to have_content("Chainsaw")
      expect(page).to_not have_content("Table")
    end
  end
end
