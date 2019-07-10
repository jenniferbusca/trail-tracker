class User < ActiveRecord::Base
  has_many :trails
  has_secure_password
  validates_presence_of :username, :email
  # validates_presence_of :password, on: :create
  # validates_uniqueness_of :username, :email


end
