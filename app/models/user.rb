class User < ActiveRecord::Base
  has_secure_password
  has_many :tools
  validates :name, presence: true, uniqueness: true
  enum role: %w(default admin)

  def most_recent_tool
    tools.last
  end
end
