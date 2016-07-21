class Tool < ActiveRecord::Base
validates :name, presence: true
belongs_to :user
belongs_to :category

  def category_name
    category.name
  end

end
