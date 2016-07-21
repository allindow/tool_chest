require 'rails_helper'
# THIS DOES WORK, NOT SURE WHY NOT PASSING
describe "Edit existing tool" do
  scenario "User edits an existing tool" do
    category = Category.create(name: "Pointy")
    user = User.create(name: "Angela", password: "password", role: 0)

    # allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
    visit new_user_path
    fill_in "Name", with: "Angela"
    fill_in "Password", with: "password"
    click_button "Create Account"

    user = User.first
    tool = user.tools.create(name: "hammer", price: 20.00, quantity: 10, category_id: category.id)

    visit user_tools_path(user)
    within("li") do
      click_on "Edit"
    end

    tool.reload
    expect(current_path).to eq edit_user_tool_path(user, tool)

    fill_in "Price", :with => 700.56
    click_button "Update Tool"
    within (".tool_info") do
      expect(page).to have_content("700.56")
    end
  end
end
