class ToolsController < ApplicationController

  def index
    @tools = Tool.all
    session[:current_tool_count] = Tool.count
  end

  def new
    @tool = Tool.new
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def create
    @tool = current_user.tools.create(tool_params)
    @tool.category_id = params[:category_id].to_i
    if @tool.save
      redirect_to user_tools_path
      flash[:alert] = "Created #{@tool.name}!"
    else
      flash.now[:error] = @tool.errors.full_messages.join(", ")
      render :new
    end
  end

  def destroy
    Tool.destroy(params[:id])
    redirect_to user_tools_path(current_user)
  end

  def edit
    @tool = Tool.find(params[:id])
    @categories = Category.all.map{|c| [ c.name, c.id ] }
  end

  def update
    tool = current_user.tools.find(params[:id])
    tool.update(tool_params)
    tool.update_attribute(:category_id, params[:category_id].to_i)
    redirect_to user_tools_path(current_user)
  end

  def tool_params
    params.require(:tool).permit(:name, :quantity, :price)
  end

  def show
    @tool = Tool.find(params[:id])
  end




end
