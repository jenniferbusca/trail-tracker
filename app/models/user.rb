class User < ActiveRecord::Base
  has_many :trails
  has_secure_password
  validates_presence_of :username, :email, :password
  validates_uniqueness_of :username, :email

  def self.valid_email?(email)
    if email.length < 5 || User.exists?(email) || !email.include?("@")
      false
    else
      true
    end
  end

  def self.valid_username?(username)
    if username.length < 2 || User.exists?(username)
      false
    else
      true
    end
  end

end
