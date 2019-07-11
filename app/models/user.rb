class User < ActiveRecord::Base
  has_many :user_trails
  has_many :trails, through: :user_trails
  has_secure_password
  validates_presence_of :username, :email
  # validates_presence_of :password, on: :create
  # validates_uniqueness_of :username, :email

  def favorite_trails
    self.trails.where("favorite = ?", "favorite")
  end

  def completed_trails
    self.trails.where("completed = ?", "completed")
  end

end
