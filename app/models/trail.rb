class Trail < ActiveRecord::Base
  has_many :user_trails, dependent: :destroy
  has_many :users, through: :user_trails
  validates_presence_of :name, :location, on: :create

end
