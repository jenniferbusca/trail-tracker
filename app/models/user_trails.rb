class UserTrails < ActiveRecord::Base
  belongs_to :user
  belongs_to :trail

end
