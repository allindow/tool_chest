class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    @tools = @category.tools.where(user_id: current_user.id)
  end

  def index
    @categories = Category.all
  end

end
